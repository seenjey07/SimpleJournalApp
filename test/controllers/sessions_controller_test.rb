require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_session_path
    assert_response :success
  end

  test "should get create" do
    get new_user_session_path
    assert_response :success
  end

  test "should get destroy" do
    get logout_sessions_path
    assert_response :success
  end
end
