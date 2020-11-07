require 'test_helper'

class LectureUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture_user = lecture_users(:one)
  end

  test "should get index" do
    get lecture_users_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_user_url
    assert_response :success
  end

  test "should create lecture_user" do
    assert_difference('LectureUser.count') do
      post lecture_users_url, params: { lecture_user: { lecture_id: @lecture_user.lecture_id, user_id: @lecture_user.user_id } }
    end

    assert_redirected_to lecture_user_url(LectureUser.last)
  end

  test "should show lecture_user" do
    get lecture_user_url(@lecture_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_user_url(@lecture_user)
    assert_response :success
  end

  test "should update lecture_user" do
    patch lecture_user_url(@lecture_user), params: { lecture_user: { lecture_id: @lecture_user.lecture_id, user_id: @lecture_user.user_id } }
    assert_redirected_to lecture_user_url(@lecture_user)
  end

  test "should destroy lecture_user" do
    assert_difference('LectureUser.count', -1) do
      delete lecture_user_url(@lecture_user)
    end

    assert_redirected_to lecture_users_url
  end
end
