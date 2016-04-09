class Processor
  def self.process(text)
    message = new(text)
    message.response
  end

  def initialize(text)
    @tokens = parse(text)
    response
  end

  def response
    if @tokens.first.downcase == 'echo'
      Message.new(action: :echo, body: @tokens[1..-1].join(' '))
    else
      Message.new(action: :unknown, body: "Sorry I don't know how to respond")
    end
  end

  private

  def parse(text)
    text.split(' ')
  end
end
