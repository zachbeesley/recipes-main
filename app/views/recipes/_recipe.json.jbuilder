json.extract! recipe, :id, :dish_name, :dish_type, :number_of_likes, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
