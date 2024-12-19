class BreakfastsController < ApplicationController
  def index
    if user_signed_in?
    @breakfasts = Recipe.where(dish_type: "Breakfast").where(user_id: current_user.id).order(:dish_name)
    @pancakesnwaffles = @breakfasts.where("dish_name like ?", "%pancake%").or(@breakfasts.where("dish_name like ?", "%waffle%"))
    @eggs = @breakfasts.where("dish_name like ?", "%egg%").or(@breakfasts.where("dish_name like ?", "%quiche%")).or(@breakfasts.where("dish_name like ?", "%omelette%"))
    @smoothies = @breakfasts.where("dish_name like ?", "%smoothie%")

    else
    @breakfasts = Recipe.where(dish_type: "Nothing").order(:dish_name)
    @pancakesnwaffles = @breakfasts.where("dish_name like ?", "%pancake%").or(@breakfasts.where("dish_name like ?", "%waffle%"))
    @eggs = @breakfasts.where("dish_name like ?", "%egg%").or(@breakfasts.where("dish_name like ?", "%quiche%")).or(@breakfasts.where("dish_name like ?", "%omelette%"))
    @smoothies = @breakfasts.where("dish_name like ?", "%smoothie%")
    end
  end
end
