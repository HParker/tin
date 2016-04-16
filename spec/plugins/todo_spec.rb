require_relative '../spec_helper'

RSpec.describe Plugins::Todo do
  subject { Plugins::Todo.message('clean my car')}
  describe '#message' do
    it "should be called a todo" do
      expect(subject.action).to eq('todo')
    end

    it 'should have the text in it' do
      expect(subject.body).to eq('clean my car')
    end
  end
end
