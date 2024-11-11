require "test_helper"

class MealPlannerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meal_planner_index_url
    assert_response :success
  end
end
