module Plugins
  class Plugin
    class << self
      def keyword(keyword, info: "")
        keywords[keyword] = [self, info]
      end

      def obj_for(keyword)
        keywords.dig(keyword, 0) || Help
      end

      def completions
        @completions ||= keywords.map { |key, val|
          { command: key, info: val.last }
        }
      end

      private

      def keywords
        @@keywords ||= {}
      end
    end
  end
end
