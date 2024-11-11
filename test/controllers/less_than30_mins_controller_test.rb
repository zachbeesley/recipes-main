require "test_helper"

class LessThan30MinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get less_than30_mins_index_url
    assert_response :success
  end
end
