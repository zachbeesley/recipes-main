require "test_helper"

class BreakfastsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breakfasts_index_url
    assert_response :success
  end
end
