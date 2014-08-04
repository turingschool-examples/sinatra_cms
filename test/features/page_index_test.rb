require './test/test_helper'

class PageIndexTest < FeatureTest
  def test_it_shows_all_pages
    skip
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    Page.create( page_data_1 )
    Page.create( page_data_2 )
    get "/pages/"
    assert_page_has page_data_1[:content]
    assert_page_has page_data_2[:content]
  end
end
