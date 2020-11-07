require "application_system_test_case"

class LectureUsersTest < ApplicationSystemTestCase
  setup do
    @lecture_user = lecture_users(:one)
  end

  test "visiting the index" do
    visit lecture_users_url
    assert_selector "h1", text: "Lecture Users"
  end

  test "creating a Lecture user" do
    visit lecture_users_url
    click_on "New Lecture User"

    fill_in "Lecture", with: @lecture_user.lecture_id
    fill_in "User", with: @lecture_user.user_id
    click_on "Create Lecture user"

    assert_text "Lecture user was successfully created"
    click_on "Back"
  end

  test "updating a Lecture user" do
    visit lecture_users_url
    click_on "Edit", match: :first

    fill_in "Lecture", with: @lecture_user.lecture_id
    fill_in "User", with: @lecture_user.user_id
    click_on "Update Lecture user"

    assert_text "Lecture user was successfully updated"
    click_on "Back"
  end

  test "destroying a Lecture user" do
    visit lecture_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lecture user was successfully destroyed"
  end
end
