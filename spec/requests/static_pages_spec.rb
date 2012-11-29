require 'spec_helper'

describe "StaticPages" do
  # describe "GET /static_pages" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get static_pages_index_path
  #     response.status.should be(200)
  #   end
  # end

  describe "About Page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content("About Us")
    end
  end
end
