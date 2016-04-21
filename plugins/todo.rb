require_relative './plugin'

module Plugins
  class Todo < Plugin
    KEYWORD_NAME = 'todo'.freeze

    keyword KEYWORD_NAME, info: 'whatever you need to get done'

    def initialize(info)
      @info = info
    end

    def response
      Message.new(title: KEYWORD_NAME, body: @info.contents)
    end

    def self.message(text, _req)
      Message.new(action: KEYWORD_NAME, body: text)
    end
  end
end
