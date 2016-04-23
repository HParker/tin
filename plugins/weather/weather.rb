# frozen_string_literal: true
require_relative '../plugin'

module Plugins
  class Weather < Plugin
    KEYWORD = 'weather'

    keyword KEYWORD, info: "show the current forecast"

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      {
       summary: @info.weather.dig(:currently, :summary),
       temperature: @info.weather.dig(:currently, :apparentTemperature),
       humidity: @info.weather.dig(:currently, :humidity)
      }
    end
  end
end
