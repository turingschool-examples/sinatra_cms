ENV['RACK_ENV'] = 'test'

require './lib/app'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

class CMSTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    CMS
  end

  def assert_ok
    assert last_response.ok?,
           "Expected OK from this responses:\n#{last_response.inspect}"
  end

  def test_it_shows_a_page
    get '/pages/1'
    assert_ok
  end
end
