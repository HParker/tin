class Processor
  class << self
    def process(text)
      response(parse(text), text)
    end

    private

    def response(tokens, text)
      Plugins::Plugin.obj_for(tokens.first.downcase).message(text)
    end

    def parse(text)
      text.split(' ')
    end
  end
end
