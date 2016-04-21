require_relative '../spec_helper'

RSpec.describe Plugins::Ip do
  describe '#message' do
    let(:info) {
      test_double = double('weather')
      allow(test_double).to receive(:weather).and_return(
        { currently: {
            summary: "Clear",
            apparentTemperature: "test temp",
            humidity: "test humidity"
          }
        })
      test_double
    }
    subject { Plugins::Weather.new(info) }

    it 'returns the weather' do
      message = subject.response
      expect(message.title).to eq('Clear')
      expect(message.body).to match("test temp")
      expect(message.body).to match("test humidity")
    end
  end
end
