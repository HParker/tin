require_relative '../spec_helper'

RSpec.describe Plugins::Ip do
  describe "#message" do
    let(:req) { OpenStruct.new(ip: 'test') }
    it "returns the users ip" do

      message = Plugins::Ip.message("hello?", req)
      expect(message.action).to eq('IP')
      expect(message.body).to eq('test')
    end
  end
end
