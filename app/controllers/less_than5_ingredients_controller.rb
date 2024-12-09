class LessThan5IngredientsController < ApplicationController
  def index
    @easy_foods = Recipe.left_joins(:ingredients).group('recipes.id').having("COUNT(ingredients.id) < 5").order(:dish_name)
  end
end
