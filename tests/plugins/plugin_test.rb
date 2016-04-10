require_relative '../helper'

context "plugin" do
  setup { Plugins::Plugin }

  context "with a keyword" do
    setup { Plugins::Plugin.keyword("hey") }

    asserts("has the keyword") { Plugins::Plugin.keywords.keys.include?("hey") }
  end
end
