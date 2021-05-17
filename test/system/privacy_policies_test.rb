require "application_system_test_case"

class PrivacyPoliciesTest < ApplicationSystemTestCase
  setup do
    @privacy_policy = privacy_policies(:one)
  end

  test "visiting the index" do
    visit privacy_policies_url
    assert_selector "h1", text: "Privacy Policies"
  end

  test "creating a Privacy policy" do
    visit privacy_policies_url
    click_on "New Privacy Policy"

    fill_in "Title", with: @privacy_policy.title
    click_on "Create Privacy policy"

    assert_text "Privacy policy was successfully created"
    click_on "Back"
  end

  test "updating a Privacy policy" do
    visit privacy_policies_url
    click_on "Edit", match: :first

    fill_in "Title", with: @privacy_policy.title
    click_on "Update Privacy policy"

    assert_text "Privacy policy was successfully updated"
    click_on "Back"
  end

  test "destroying a Privacy policy" do
    visit privacy_policies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Privacy policy was successfully destroyed"
  end
end
