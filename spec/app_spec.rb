require_relative 'spec_helper'

scope do
  test 'home' do
    get '/'
    assert_equal 200, last_response.status
  end

  test 'help' do
    get '/?q=help'
    assert_equal 200, last_response.status
    assert_equal JSON.parse(last_response.body), 'title' => 'Help', 'body' => Plugins::Help::HELP_MESSAGE
  end

  test 'comp' do
    get '/comp?pack=default'
    assert_equal 200, last_response.status
    assert_equal JSON.parse(last_response.body)[0].keys, %w(command info)
  end
end
