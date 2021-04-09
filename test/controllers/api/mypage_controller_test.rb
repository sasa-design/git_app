require "test_helper"

class Api::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_mypage_index_url
    assert_response :success
  end
end
