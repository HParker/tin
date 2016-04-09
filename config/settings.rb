require "envoker"

Envoker.load

module Settings
  RACK_ENV       = Envoker.fetch("RACK_ENV", "development")
  REDIS_URL      = Envoker.fetch("REDIS_URL")
  SESSION_KEY    = Envoker.fetch("SESSION_KEY")
  SESSION_SECRET = Envoker.fetch("SESSION_SECRET")
  SMTP_URL       = Envoker.fetch("SMTP_URL")
end
