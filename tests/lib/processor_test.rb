require_relative '../helper'

context "processor" do
  setup { Processor }
  context "process help" do
    setup { topic.process("help hello world") }

    asserts("it returns a message") { topic.body.match(/Hello/) }
    asserts("knows what action it took") { topic.action == "help" }
  end

  context "not case sensitive" do
    setup { topic.process("HELP hello world") }

    asserts("knows what action it took") {
      puts topic.action.inspect
      topic.action == "help"
    }
  end

  context "process unknown" do
    setup { topic.process("asdf") }

    asserts("it returns the unknown action") {
      topic.action == 'help'
    }
    asserts("it returns a message") {
      topic.body.length > 0
    }
  end
end
