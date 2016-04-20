require_relative '../spec_helper'

RSpec.describe Plugins::Help do
  let(:info) { Info.new("whoami", OpenStruct.new(ip: '0.0.0.0'))}
  let(:expected_help) { Message.new(title: "help", body: Plugins::Help::HELP_MESSAGE) }
  subject { Plugins::Help.new(info).response }

  describe "#action" do
    it { expect(subject.title).to eq(expected_help.title) }
    it { expect(subject.body).to eq(expected_help.body) }
  end
end
