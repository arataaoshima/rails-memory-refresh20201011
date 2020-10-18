require "application_system_test_case"

class SheetLinksTest < ApplicationSystemTestCase
  setup do
    @sheet_link = sheet_links(:one)
  end

  test "visiting the index" do
    visit sheet_links_url
    assert_selector "h1", text: "Sheet Links"
  end

  test "creating a Sheet link" do
    visit sheet_links_url
    click_on "New Sheet Link"

    fill_in "Lecture", with: @sheet_link.lecture_id
    fill_in "Title", with: @sheet_link.title
    fill_in "Type", with: @sheet_link.type
    fill_in "Url", with: @sheet_link.url
    click_on "Create Sheet link"

    assert_text "Sheet link was successfully created"
    click_on "Back"
  end

  test "updating a Sheet link" do
    visit sheet_links_url
    click_on "Edit", match: :first

    fill_in "Lecture", with: @sheet_link.lecture_id
    fill_in "Title", with: @sheet_link.title
    fill_in "Type", with: @sheet_link.type
    fill_in "Url", with: @sheet_link.url
    click_on "Update Sheet link"

    assert_text "Sheet link was successfully updated"
    click_on "Back"
  end

  test "destroying a Sheet link" do
    visit sheet_links_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sheet link was successfully destroyed"
  end
end
