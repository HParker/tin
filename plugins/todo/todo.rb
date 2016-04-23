# frozen_string_literal: true
require_relative '../plugin'

module Plugins
  class Todo < Plugin
    KEYWORD = 'todo'

    keyword KEYWORD, info: 'whatever you need to get done'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      {
       body: @info.contents
      }
    end
  end
end
