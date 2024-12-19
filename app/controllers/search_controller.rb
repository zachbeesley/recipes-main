class SearchController < ApplicationController
  def index
    @recipes = current_user.recipes
    @q = @recipes.ransack(params[:q])
    @Recipes = @q.result(distinct: true)
  end
end
