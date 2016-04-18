require_relative '../spec_helper'

RSpec.describe Plugins::Help do
  let(:default_help) { Message.new(action: "help", body: Plugins::Help::HELP_MESSAGE).as_json }
  describe "#action" do
    it { expect(Plugins::Help.message("", nil).as_json).to eq(default_help) }
  end
end
