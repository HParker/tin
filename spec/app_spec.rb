# frozen_string_literal: true
require_relative 'spec_helper'
include Mote::Helpers

scope do
  test 'home' do
    get '/'
    assert_equal 200, last_response.status
  end

  test 'help' do
    get '/?q=help'
    assert_equal 200, last_response.status
    assert_equal JSON.parse(last_response.body),
      'title' => 'Help help',
      'body' => mote('./plugins/help/help.mote', {}),
      'refresh_rate' => 0,
      'refresh_url' => ''
  end

  test 'comp' do
    get '/comp?pack=default'
    assert_equal 200, last_response.status
    assert_equal JSON.parse(last_response.body)[0].keys, %w(command info)
  end
end
