require_relative '../helper'

context "processor" do
  setup { Processor }
  context "process echo" do
    setup { topic.process("echo hello world") }

    asserts("it returns a message") { topic.body == "hello world" }
    asserts("knows what action it took") { topic.action == :echo }
  end

  context "not case sensitive" do
    setup { topic.process("ECHO hello world") }

    asserts("knows what action it took") { topic.action == :echo }
  end

  context "process unknown" do
    setup { topic.process("asdf") }

    asserts("it returns the unknown action") { topic.action == :unknown }
    asserts("it returns a message") {
      topic.body == "Sorry I don't know how to respond"
    }
  end
end
