# frozen_string_literal: true
class Message
  attr_reader :title, :body

  def initialize(title:, body:)
    @title = title
    @body = body
  end

  def as_json
    { title: title.to_s.capitalize, body: body }
  end
end
