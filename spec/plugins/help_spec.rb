# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Plugins::Help do
  let(:info) { Info.new('whoami', OpenStruct.new(ip: '0.0.0.0')) }
  subject { Plugins::Help.new(info).response }

  describe '#action' do
    it { expect(subject.title).to eq('help help') }
    it { expect(subject.body).to match('Hello') }
  end
end
