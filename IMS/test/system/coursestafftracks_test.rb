require "application_system_test_case"

class CoursestafftracksTest < ApplicationSystemTestCase
  setup do
    @coursestafftrack = coursestafftracks(:one)
  end

  test "visiting the index" do
    visit coursestafftracks_url
    assert_selector "h1", text: "Coursestafftracks"
  end

  test "creating a Coursestafftrack" do
    visit coursestafftracks_url
    click_on "New Coursestafftrack"

    click_on "Create Coursestafftrack"

    assert_text "Coursestafftrack was successfully created"
    click_on "Back"
  end

  test "updating a Coursestafftrack" do
    visit coursestafftracks_url
    click_on "Edit", match: :first

    click_on "Update Coursestafftrack"

    assert_text "Coursestafftrack was successfully updated"
    click_on "Back"
  end

  test "destroying a Coursestafftrack" do
    visit coursestafftracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coursestafftrack was successfully destroyed"
  end
end
