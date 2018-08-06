require "application_system_test_case"

class SitedpostsTest < ApplicationSystemTestCase
  setup do
    @sitedpost = sitedposts(:one)
  end

  test "visiting the index" do
    visit sitedposts_url
    assert_selector "h1", text: "Sitedposts"
  end

  test "creating a Sitedpost" do
    visit sitedposts_url
    click_on "New Sitedpost"

    fill_in "Content", with: @sitedpost.content
    fill_in "Position", with: @sitedpost.position
    click_on "Create Sitedpost"

    assert_text "Sitedpost was successfully created"
    click_on "Back"
  end

  test "updating a Sitedpost" do
    visit sitedposts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @sitedpost.content
    fill_in "Position", with: @sitedpost.position
    click_on "Update Sitedpost"

    assert_text "Sitedpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Sitedpost" do
    visit sitedposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sitedpost was successfully destroyed"
  end
end
