require_relative './plugin'

module Plugins
  class Help < Plugin
    HELP_MESSAGE = <<~MSG
      _Hello_,

      this is Tin. Tin is meant to be a text interface to a suite of helpful
      tools and knowledge. There are a number of helpful commands:
      * Help

      I'll be sure to add more soon.
    MSG

    keyword "help", info: "show info about Tin"

    def initialize(_info)
    end

    def response
      Message.new(title: "help", body: HELP_MESSAGE)
    end
  end
end
