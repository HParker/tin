require_relative '../spec_helper'

RSpec.describe Plugins::Plugin do
  describe "keyword" do
    it "takes a keyword and optional info" do
      expect(Plugins::Plugin.keyword("hey", info: "ya")).
        to eq([Plugins::Plugin, "ya"])
    end
  end

  describe "#obj_for" do
    it { expect(Plugins::Plugin.obj_for("help")).to eq(Plugins::Help) }
  end

  describe "completions" do
    it "returns keyword and info" do
      expect(Plugins::Plugin.completions[0].keys).
        to match_array([:command, :info])
    end
  end
end
