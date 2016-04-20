require_relative './plugin'
require 'maxminddb'

module Plugins
  class Ip < Plugin
    KEYWORD_NAME = 'whoami'


    keyword KEYWORD_NAME, info: "Show information about who you identify yourself as"

    class << self
      def message(text, req)
        Message.new(action: 'IP', body: body(req))
      end

      private

      def body(req)
        db = MaxMindDB.new(File.join(ROOT, 'db/GeoLite2-City.mmdb'))
        location = db.lookup(req.ip)
        <<~MARKDOWN
          IP: #{req.ip}

          **City**: #{location.city.name} \t **Country**: #{location.country.name}

         <sub>This product includes GeoLite2 data created by MaxMind, available from
         <a href="http://www.maxmind.com">http://www.maxmind.com</a>.</sub>
        MARKDOWN
      end
    end
  end
end
