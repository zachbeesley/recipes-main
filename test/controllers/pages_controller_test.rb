require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get breakfast" do
    get pages_breakfast_url
    assert_response :success
  end
end
