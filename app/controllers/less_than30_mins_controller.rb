class LessThan30MinsController < ApplicationController
  def index
    if user_signed_in?
    @quick_foods = Recipe.where("prep_time + cook_time < 30").where(user_id: current_user.id).order(:dish_name)
    @dairys = @quick_foods.joins(:ingredients).where("ingredients.content like ?", '%cream%').or(@quick_foods.joins(:ingredients).where("ingredients.content like ?", '%cheese%')).or(@quick_foods.joins(:ingredients).where("ingredients.content like ?", '%milk%')).or(@quick_foods.joins(:ingredients).where("ingredients.content like ?", '%butter%')).or(@quick_foods.joins(:ingredients).where("ingredients.content like ?", '%yogurt%')).distinct
    @dairyfrees = @quick_foods.excluding(@dairys)

    else
    @quick_foods = Recipe.where(dish_type: "Nothing").order(:dish_name)
    end
  end
end
