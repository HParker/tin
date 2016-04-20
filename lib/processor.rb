class Processor
  class << self
    def process(text, req)
      response(info(text, req))
    end

    private

    def response(info)
      plugin(info.keyword).new(info).response
    end

    def plugin(token)
      Plugins::Plugin.obj_for(token)
    end

    def info(text, req)
      Info.new(text, req)
    end
  end
end
