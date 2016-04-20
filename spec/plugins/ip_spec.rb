require_relative '../spec_helper'

RSpec.describe Plugins::Ip do
  describe "#message" do
    let(:info) { Info.new("whoami", OpenStruct.new(ip: '0.0.0.0'))}
    subject { Plugins::Ip.new(info) }

    it "returns the users ip" do
      message = subject.response
      expect(message.title).to eq('whoami')
      expect(message.body).to match("IP")
      expect(message.body).to match("City")
      expect(message.body).to match("Country")
    end
  end
end
