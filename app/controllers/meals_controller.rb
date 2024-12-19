class MealsController < ApplicationController
  def index
    if user_signed_in?
    @meals = Recipe.where(dish_type: "Meal").where(user_id: current_user.id).order(:dish_name)
    @soupsandsalads = @meals.where("dish_name like ?", "%soup%").or(@meals.where("dish_name like ?", "%salad%"))

    @pastas = @meals.where("dish_name like ?", "%pasta%").or(@meals.where("dish_name like ?", "%spaghetti%")).or(@meals.where("dish_name like ?", "%fettuccine%")).or(@meals.where("dish_name like ?", "%mac%")).or(@meals.where("dish_name like ?", "%gnocchi%")).or(@meals.where("dish_name like ?", "%lasagna%")).or(@meals.where("dish_name like ?", "%ravioli%")).or(@meals.where("dish_name like ?", "%linguine%"))

    @poultrys = @meals.joins(:ingredients).where("ingredients.content like ?", '%chicken%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%turkey%')).distinct

    @beefs = @meals.joins(:ingredients).where("ingredients.content like ?", '%beef%').distinct

    @seafoods = @meals.joins(:ingredients).where("ingredients.content like ?", '%fish%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%salmon%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%shrimp%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%lobster%')).distinct



    dairy_terms = ['milk', 'cheese', 'cream', 'butter', 'yogurt']
    @dairys = @meals.joins(:ingredients).where("ingredients.content like ?", '%cream%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%cheese%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%milk%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%butter%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%yogurt%')).distinct
    @dairyfrees = @meals.excluding(@dairys)

    @vegetarians = @meals.excluding(@poultrys).excluding(@beefs).excluding(@seafoods)

    else
      @meals = Recipe.where(dish_type: "Nothing").order(:dish_name)
      @soupsandsalads = @meals.where("dish_name like ?", "%soup%").or(@meals.where("dish_name like ?", "%salad%"))
  
      @pastas = @meals.where("dish_name like ?", "%pasta%").or(@meals.where("dish_name like ?", "%spaghetti%")).or(@meals.where("dish_name like ?", "%fettuccine%")).or(@meals.where("dish_name like ?", "%mac%")).or(@meals.where("dish_name like ?", "%gnocchi%")).or(@meals.where("dish_name like ?", "%lasagna%")).or(@meals.where("dish_name like ?", "%ravioli%")).or(@meals.where("dish_name like ?", "%linguine%"))
  
      @poultrys = @meals.joins(:ingredients).where("ingredients.content like ?", '%chicken%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%turkey%')).distinct
  
      @beefs = @meals.joins(:ingredients).where("ingredients.content like ?", '%beef%').distinct
  
      @seafoods = @meals.joins(:ingredients).where("ingredients.content like ?", '%fish%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%salmon%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%shrimp%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%lobster%')).distinct
  
  
  
      dairy_terms = ['milk', 'cheese', 'cream', 'butter', 'yogurt']
      @dairys = @meals.joins(:ingredients).where("ingredients.content like ?", '%cream%').or(@meals.joins(:ingredients).where("ingredients.content like ?", '%cheese%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%milk%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%butter%')).or(@meals.joins(:ingredients).where("ingredients.content like ?", '%yogurt%')).distinct
      @dairyfrees = @meals.excluding(@dairys)
  
      @vegetarians = @meals.excluding(@poultrys).excluding(@beefs).excluding(@seafoods)
    end
  end
end
