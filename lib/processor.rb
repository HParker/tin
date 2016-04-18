class Processor
  class << self
    def process(text, req)
      response(parse(text), req)
    end

    private

    def response(tokens, req)
      Plugins::Plugin.obj_for(tokens.first.downcase).message(contents(tokens), req)
    end

    def parse(text)
      text.split(' ')
    end

    def contents(tokens)
      tokens.drop(1).join(' ')
    end
  end
end
