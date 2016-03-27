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
    if @tokens.first == 'echo'
      @tokens[1..-1].join
    else
      "I don't know how to respond to that"
    end
  end

  private


  def parse(text)
    text.split(' ')
  end
end
