class DessertsController < ApplicationController
  def index
    @desserts = Recipe.where(dish_type: "Dessert").order(:dish_name)
    @cakes = @desserts.where("dish_name like ?", "%cake%")
    @pies = @desserts.where("dish_name like ?", "%pie%")
    @cookies = @desserts.where("dish_name like ?", "%cookie%")
    @tarts = @desserts.where("dish_name like ?", "%tart%")
  end
end
