require 'spec_helper'

describe "Static Pages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector("h1",     text: heading) }
    it { should have_selector("title",  text: page_title ) }
  end

  describe "Home Page" do
    before { visit root_path }

    let(:heading) { "Demo" }
    let(:page_title) { "" }

    it_should_behave_like "all static pages"
    it { should_not have_selector("title", text: " | Home") }
  end

  describe "Help Page" do
    before { visit help_path }

    let(:heading) { "Help" }
    let(:page_title) { "Help" }

    it_should_behave_like "all static pages"
  end

  describe "About Page" do
    before { visit about_path }

    let(:heading) { "About Us" }
    let(:page_title) { "About Us" }

    it_should_behave_like "all static pages"
  end

  describe "Contact Page" do
    before { visit contact_path }

    let(:heading) { "Contact" }
    let(:page_title) { "Contact" }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on layouts" do
    visit root_url

    click_link "Sign up now!"
    page.should have_selector "title", text: "Sign Up"

    click_link "Help"
    page.should have_selector "title", text: "Help"

    click_link "About"
    page.should have_selector "title", text: "About Us"

    click_link "Contact"
    page.should have_selector "title", text: "Contact"

    click_link "Sign In"
    page.should have_selector "title", text: "Sign In"

    click_link "Demo"
    page.should have_selector "title", text: full_title("")
  end

  # describe "GET /static_pages" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get static_pages_index_path
  #     response.status.should be(200)
  #   end
  # end
end
