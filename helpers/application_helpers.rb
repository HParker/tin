require 'rollbar'

module ApplicationHelpers
  Rollbar.configure do |config|
    config.access_token = ENV['ROLLBAR_KEY']
  end
end
