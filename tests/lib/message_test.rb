require_relative '../helper'

context "message" do
  setup { Message }
  context "echo" do
    setup { topic.new(action: :echo, body: "hi there") }
    asserts("#action") { topic.action == :echo }
    asserts("#body") { topic.body == 'hi there' }
  end
end
