require_relative '../spec_helper'

RSpec.describe Processor do
  describe "process" do
    describe "help" do
      it { expect(Processor.process("help").as_json.keys).to match_array([:title, :body]) }
    end

    describe "unknown" do
      it { expect(Processor.process("asdf").as_json.keys).to match_array([:title, :body]) }
    end
  end
end
