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

  def assert_page_has(content)
    assert last_response.body.include?(content),
           ["Expected this content:",
            content,
            "in this response body:",
            last_response.body.inspect].join("\n")
  end

  def test_it_shows_a_page
    get '/pages/1'
    assert_ok
  end

  def test_it_shows_a_page_by_slug
    page_data = {:slug => "location",
                 :content => "We're located in Denver, CO!"}

    Page.create( page_data )
    get "/pages/#{page_data[:slug]}"
    assert_page_has page_data[:content]
  end
end
