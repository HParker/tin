require_relative './plugin'

module Plugins
  class Help < Plugin
    HELP_MESSAGE = <<~MSG
    Hello,
    This is Tin. This is meant to be a text interface to a suite of helpful
    Tools and knowledge. There are a number of helpful commands including
    Help and That is all right now!
    MSG

    keyword "help"

    def self.action(_text)
      Message.new(action: "help", body: HELP_MESSAGE)
    end
  end
end
