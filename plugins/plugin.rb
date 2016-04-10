module Plugins
  class Plugin
    def self.keyword(keyword)
      keywords[keyword] = self
    end

    def self.keywords
      @@keywords ||= {}
    end
  end
end
