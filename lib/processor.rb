class Processor
  class << self
    def process(text)
      response(parse(text))
    end

    private

    def response(tokens)
      Plugins::Plugin.obj_for(tokens.first.downcase).message(contents(tokens))
    end

    def parse(text)
      text.split(' ')
    end

    def contents(tokens)
      tokens.drop(1).join(' ')
    end
  end
end
