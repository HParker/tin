require_relative '../plugin'

module Plugins
  class Help < Plugin
    KEYWORD = 'help'

    keyword KEYWORD, info: "show info about Tin"

    def title
      KEYWORD
    end


    def initialize(info)
      @info = info
    end

    def response
      Plugin.obj_for(@info.args.first).new(nil).help
    end
  end
end
