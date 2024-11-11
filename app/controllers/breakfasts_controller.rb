class BreakfastsController < ApplicationController
  def index
    @breakfasts = Recipe.where(dish_type: "Breakfast").order(:dish_name)
  end
end
