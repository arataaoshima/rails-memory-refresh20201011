require 'test_helper'

class SheetLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sheet_link = sheet_links(:one)
  end

  test "should get index" do
    get sheet_links_url
    assert_response :success
  end

  test "should get new" do
    get new_sheet_link_url
    assert_response :success
  end

  test "should create sheet_link" do
    assert_difference('SheetLink.count') do
      post sheet_links_url, params: { sheet_link: { lecture_id: @sheet_link.lecture_id, title: @sheet_link.title, type: @sheet_link.type, url: @sheet_link.url } }
    end

    assert_redirected_to sheet_link_url(SheetLink.last)
  end

  test "should show sheet_link" do
    get sheet_link_url(@sheet_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_sheet_link_url(@sheet_link)
    assert_response :success
  end

  test "should update sheet_link" do
    patch sheet_link_url(@sheet_link), params: { sheet_link: { lecture_id: @sheet_link.lecture_id, title: @sheet_link.title, type: @sheet_link.type, url: @sheet_link.url } }
    assert_redirected_to sheet_link_url(@sheet_link)
  end

  test "should destroy sheet_link" do
    assert_difference('SheetLink.count', -1) do
      delete sheet_link_url(@sheet_link)
    end

    assert_redirected_to sheet_links_url
  end
end
