class LessThan5IngredientsController < ApplicationController
  def index
    if user_signed_in?
    @easy_foods = Recipe.left_joins(:ingredients).where(user_id: current_user.id).group('recipes.id').having("COUNT(ingredients.id) < 5").order(:dish_name)
    @dairys = @easy_foods.joins(:ingredients).where("ingredients.content like ?", '%cream%').or(@easy_foods.joins(:ingredients).where("ingredients.content like ?", '%cheese%')).or(@easy_foods.joins(:ingredients).where("ingredients.content like ?", '%milk%')).or(@easy_foods.joins(:ingredients).where("ingredients.content like ?", '%butter%')).or(@easy_foods.joins(:ingredients).where("ingredients.content like ?", '%yogurt%')).distinct
    @dairyfrees = @easy_foods.excluding(@dairys)
    
    else
      @easy_foods = Recipe.where(dish_type: "Nothing").order(:dish_name)
    end
  end
end
