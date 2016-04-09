class Message
  attr_reader :action, :body

  def initialize(action:, body:)
    @action = action
    @body = body
  end

  def as_json
    { title: action.to_s.capitalize, body: body }
  end
end
