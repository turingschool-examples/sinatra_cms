require './test/test_helper'

class PageTest < Minitest::Test
  def test_it_stores_a_page
    page_data = {:slug    => "about-us",
                 :content => "Our site is great!"}

    returned_page = Page.create( page_data )
    found_page    = Page.find_by_slug( page_data[:slug] )

    assert_equal returned_page, found_page
    assert_equal page_data[:slug], found_page.slug
    assert_equal page_data[:content], found_page.content
  end
end
