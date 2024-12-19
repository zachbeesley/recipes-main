class HomeController < ApplicationController
  def index
    if user_signed_in?
    @recipes = current_user.recipes
    @breakfasts = @recipes.where(dish_type: "Breakfast").order(:dish_name)
    @meals = @recipes.where(dish_type: "Meal").order(:dish_name)
    @desserts = @recipes.where(dish_type: "Dessert").order(:dish_name)
    @snacks = @recipes.where(dish_type: "Snack").order(:dish_name)
    @quick_foods = @recipes.where("prep_time + cook_time < 30").order(:dish_name)
    @easy_foods = @recipes.left_joins(:ingredients).group('recipes.id').having("COUNT(ingredients.id) < 5").order(:dish_name)

    else
      @breakfasts = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @meals = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @desserts = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @snacks = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @quick_foods = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @easy_foods = Recipe.where(dish_type: "Nothing").order(:dish_name)    
    end
  end

  def about
    @recipes = Recipe.all
    @breakfasts = Recipe.where(dish_type: "Breakfast").order(:dish_name)
    @about_me = "My name is Zach" 
    @answer = 2 + 2
    puts "About action triggered"
    logger.debug "About action triggered"
  end
end
