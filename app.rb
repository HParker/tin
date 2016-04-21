require 'json'
require 'bundler/setup'
require 'cuba'
require 'cuba/safe'
require 'hmote'
require 'hmote/render'
require 'ment'
require 'ohm'
require 'posten'
require 'scrivener'

require_relative 'config/encoding'
require_relative 'config/settings'
require_relative 'config/database'
require_relative 'config/posten'

ROOT = File.dirname(__FILE__)

Cuba.plugin(Cuba::Safe)
Cuba.plugin(HMote::Render)
Cuba.plugin(Ment)

Cuba.use(
  Rack::Session::Cookie,
  key: Settings::SESSION_KEY,
  secret: Settings::SESSION_SECRET,
  http_only: Cuba.production?,
  secure: Cuba.production?
)

Cuba.use(
  Rack::Static,
  urls: %w(/js /css /images),
  root: './public'
)

Dir['./models/**/*.rb'].each   { |f| require(f) }
Dir['./filters/**/*.rb'].each  { |f| require(f) }
Dir['./services/**/*.rb'].each { |f| require(f) }
Dir['./helpers/**/*.rb'].each  { |f| require(f) }
Dir['./mailers/**/*.rb'].each  { |f| require(f) }
Dir['./routes/**/*.rb'].each   { |f| require(f) }
Dir['./lib/**/*.rb'].each { |f| require(f) }
Dir['./plugins/**/*.rb'].each { |f| require(f) }

Cuba.plugin(ApplicationHelpers)

Cuba.define do
  on csrf.unsafe? do
    csrf.reset!

    res.status = 403
    res.write('Forbidden: Invalid CSRF token.')

    halt(res.finish)
  end

  on root do
    on param('q') do |query|
      response = Processor.process(query, req)
      res.write(JSON.generate(response.as_json))
    end
    render('home')
  end

  on 'comp' do
    on param('pack') do |_completion_pack|
      res.write(JSON.generate(Plugins::Plugin.completions))
    end
  end
end
