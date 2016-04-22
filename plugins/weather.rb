require_relative './plugin'

module Plugins
  class Weather < Plugin
    KEYWORD_NAME = 'weather'

    keyword KEYWORD_NAME, info: "show the current forecast"

    def initialize(info)
      @info = info
    end

    def response
      Message.new(title: @info.weather.dig(:currently, :summary), body: body)
    end

    private

    def body
      <<~MARKDOWN
      **Temperature**: #{@info.weather.dig(:currently, :apparentTemperature)}
      \t **Humidity**: #{@info.weather.dig(:currently, :humidity)}
      MARKDOWN
    end
  end
end
