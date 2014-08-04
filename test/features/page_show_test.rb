require './test/test_helper'

class PageShowTest < FeatureTest
  def test_it_shows_a_page_by_slug
    page_data = {:slug => "location",
                 :content => "We're located in Denver, CO!"}

    Page.create( page_data )
    get "/pages/#{page_data[:slug]}"
    assert_page_has page_data[:content]
  end
end
