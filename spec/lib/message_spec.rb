require_relative '../spec_helper'

RSpec.describe Message do
  let(:subject) { Message.new(title: "hey", body: "ya") }

  describe 'attr_reader' do
    it { expect(subject.title).to eq("hey") }
    it { expect(subject.body).to eq("ya") }
  end

  describe "as_json" do
    it { expect(subject.as_json.keys).to match_array([:title, :body])}
  end
end
