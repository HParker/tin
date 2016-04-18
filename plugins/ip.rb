require_relative './plugin'

module Plugins
  class Ip < Plugin
    KEYWORD_NAME = 'ip'

    keyword KEYWORD_NAME, info: "show your current IP address"

    def self.message(text, req)
      Message.new(action: 'IP', body: req.ip)
    end
  end
end
