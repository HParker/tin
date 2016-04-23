# frozen_string_literal: true
require 'envoker'
require 'rollbar'
require 'forecast_io'

Envoker.load

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_KEY']
end

ForecastIO.configure do |configuration|
  configuration.api_key = ENV['FORECAST_IO_KEY']
end

module Settings
  RACK_ENV       = Envoker.fetch('RACK_ENV', 'development')
  REDIS_URL      = Envoker.fetch('REDIS_URL')
  SESSION_KEY    = Envoker.fetch('SESSION_KEY')
  SESSION_SECRET = Envoker.fetch('SESSION_SECRET')
  SMTP_URL       = Envoker.fetch('SMTP_URL')
end
