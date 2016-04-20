require_relative './plugin'
require 'maxminddb'

module Plugins
  class Ip < Plugin
    KEYWORD_NAME = 'whoami'


    keyword KEYWORD_NAME, info: "Show information about who you identify yourself as"

    def initialize(info)
      @info = info
    end

    def response
      Message.new(title: KEYWORD_NAME, body: body)
    end

    private

    def body
      <<~MARKDOWN
        IP: #{@info.ip}

        **City**: #{@info.city_name} \t **Country**: #{@info.country_name}

        <sub>This product includes GeoLite2 data created by MaxMind, available from
        <a href="http://www.maxmind.com">http://www.maxmind.com</a>.</sub>
      MARKDOWN
    end
  end
end
