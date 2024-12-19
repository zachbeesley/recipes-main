class DessertsController < ApplicationController
  def index
    if user_signed_in?
    @desserts = Recipe.where(dish_type: "Dessert").where(user_id: current_user.id).order(:dish_name)
    @cakes = @desserts.where("dish_name like ?", "%cake%")
    @pies = @desserts.where("dish_name like ?", "%pie%")
    @cookies = @desserts.where("dish_name like ?", "%cookie%")
    @tarts = @desserts.where("dish_name like ?", "%tart%")

    else
    @desserts = Recipe.where(dish_type: "Nothing").order(:dish_name)
    @cakes = @desserts.where("dish_name like ?", "%cake%")
    @pies = @desserts.where("dish_name like ?", "%pie%")
    @cookies = @desserts.where("dish_name like ?", "%cookie%")
    @tarts = @desserts.where("dish_name like ?", "%tart%")
    end
  end
end
