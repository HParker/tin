class Processor
  def self.process(text)
    response(parse(text), text)
  end

  def self.response(tokens, text)
    plugin = Plugins::Plugin.keywords[tokens.first.downcase] ||
      Plugins::Help
    plugin.action("")
  end

  private

  def self.parse(text)
    text.split(' ')
  end
end
