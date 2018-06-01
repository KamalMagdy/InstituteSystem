require "application_system_test_case"

class AssignmentstaffstudentsTest < ApplicationSystemTestCase
  setup do
    @assignmentstaffstudent = assignmentstaffstudents(:one)
  end

  test "visiting the index" do
    visit assignmentstaffstudents_url
    assert_selector "h1", text: "Assignmentstaffstudents"
  end

  test "creating a Assignmentstaffstudent" do
    visit assignmentstaffstudents_url
    click_on "New Assignmentstaffstudent"

    click_on "Create Assignmentstaffstudent"

    assert_text "Assignmentstaffstudent was successfully created"
    click_on "Back"
  end

  test "updating a Assignmentstaffstudent" do
    visit assignmentstaffstudents_url
    click_on "Edit", match: :first

    click_on "Update Assignmentstaffstudent"

    assert_text "Assignmentstaffstudent was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignmentstaffstudent" do
    visit assignmentstaffstudents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignmentstaffstudent was successfully destroyed"
  end
end
