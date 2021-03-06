# frozen_string_literal: true
module Plugins
  class Plugin
    include Mote::Helpers

    def response
      Message.new(title: title,
                  body: body,
                  refresh_rate: refresh_rate,
                  refresh_url: refresh_url
                 )
    end

    def body
      mote("./plugins/#{title}/#{title}.mote", contents)
    end

    def help
      Message.new(title: "help #{title}",
                  body: mote("./plugins/#{title}/help.mote"),
                  refresh_rate: refresh_rate,
                  refresh_url: refresh_url
                 )
    end

    def contents
      {}
    end

    def refresh_rate
      0
    end

    def refresh_url
      ""
    end

    class << self
      def keyword(keyword, info: '')
        keywords[keyword] = [self, info]
      end

      def obj_for(keyword)
        keywords.dig(keyword, 0) || Help
      end

      def completions
        @completions ||= keywords.map do |key, val|
          { command: key, info: val.last }
        end
      end

      private

      def keywords
        @@keywords ||= {}
      end
    end
  end
end
