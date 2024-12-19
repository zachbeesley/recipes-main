class LessThan5IngredientsController < ApplicationController
  def index
    if user_signed_in?
    @easy_foods = Recipe.left_joins(:ingredients).where(user_id: current_user.id).group('recipes.id').having("COUNT(ingredients.id) < 5").order(:dish_name)
    
    else
      @easy_foods = Recipe.where(:dish_type: "Nothing").order(:dish_name)
  end
end
