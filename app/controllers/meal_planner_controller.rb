class MealPlannerController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
