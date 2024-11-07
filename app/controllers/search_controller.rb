class SearchController < ApplicationController
  def index
    @q = Recipe.ransack(params[:q])
    @Recipes = @q.result(distinct: true)
  end
end
