require_relative './plugin'

module Plugins
  class Todo < Plugin
    KEYWORD_NAME = 'todo'

    keyword KEYWORD_NAME, info: "whatever you need to get done"

    def self.message(text)
      Message.new(action: KEYWORD_NAME, body: text)
    end
  end
end
