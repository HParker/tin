require_relative '../helper'

context "plugin" do
  context "help" do
    setup { Plugins::Help }

    asserts("returns the help message") { topic.action("doesn't matter").body.match /Hello/ }
  end
end
