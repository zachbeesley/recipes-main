require "test_helper"

class LessThan5IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get less_than5_ingredients_index_url
    assert_response :success
  end
end
