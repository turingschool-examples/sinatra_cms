require './test/test_helper'

class PageIndexTest < FeatureTest
  def test_it_shows_all_pages
    skip
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    # Create the two pages in the database
    # Load the `/pages` page
    # Check that the `content` of each page is in the index
  end
end
