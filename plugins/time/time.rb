# frozen_string_literal: true
require_relative '../plugin'

module Plugins
  class Time < Plugin
    KEYWORD = 'time'

    keyword KEYWORD, info: 'Just returns the time'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      {
       time: ::Time.now
      }
    end

    def refresh_rate
      10
    end

    def refresh_url
      "/?q=time"
    end
  end
end
