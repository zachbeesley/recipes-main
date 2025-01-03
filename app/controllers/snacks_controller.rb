class SnacksController < ApplicationController
    def index
        if user_signed_in?
        @snacks = Recipe.where(dish_type: "Snack").where(user_id: current_user.id).order(:dish_name)
        @dairys = @snacks.joins(:ingredients).where("ingredients.content like ?", '%cream%').or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%cheese%')).or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%milk%')).or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%butter%')).or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%yogurt%')).distinct
        @dairyfrees = @snacks.excluding(@dairys)

        @sweets = @snacks.joins(:ingredients).where("ingredients.content like ?", '%sugar%').or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%syrup%')).or(@snacks.joins(:ingredients).where("ingredients.content like ?", '%chocolate%')).distinct
        @savourys = @snacks.excluding(@sweets)

    
        else
        @snacks = Recipe.where(dish_type: "Nothing").order(:dish_name)

        end
    end
end
