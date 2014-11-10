ENV['RACK_ENV'] = 'test'

require './lib/app'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'bundler'
Bundler.require

module CleanTheDatabase
  DatabaseCleaner.strategy=(:truncation)

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

class Minitest::Test
  include CleanTheDatabase
end

class FeatureTest < MiniTest::Test
  include Rack::Test::Methods
  include Capybara::DSL

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

end
