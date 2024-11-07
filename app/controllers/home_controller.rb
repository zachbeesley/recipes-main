class HomeController < ApplicationController
  def index
    @breakfasts = Recipe.where(dish_type: "Breakfast").order(:dish_name)
    @meals = Recipe.where(dish_type: "Meal").order(:dish_name)
    @desserts = Recipe.where(dish_type: "Dessert").order(:dish_name)
    @snacks = Recipe.where(dish_type: "Snack").order(:dish_name)
    @quick_foods = Recipe.where("prep_time + cook_time < 30").order(:dish_name)
    @easy_foods = Recipe.left_joins(:ingredients).group('recipes.id').having("COUNT(ingredients.id) < 5").order(:dish_name)
    @recipes = Recipe.all
  end

  def about
    @about_me = "My name is Zach" 
    @answer = 2 + 2
    puts "About action triggered"
    logger.debug "About action triggered"
  end
end
