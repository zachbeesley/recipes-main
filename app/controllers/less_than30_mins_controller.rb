class LessThan30MinsController < ApplicationController
  def index
    if user_signed_in?
    @quick_foods = Recipe.where("prep_time + cook_time < 30").where(user_id: current_user.id).order(:dish_name)

    else
    @easy_foods = Recipe.where(:dish_type: "Nothing").order(:dish_name)
    end
  end
end
