class LessThan30MinsController < ApplicationController
  def index
    @quick_foods = Recipe.where("prep_time + cook_time < 30").order(:dish_name)
  end
end
