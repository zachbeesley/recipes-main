json.extract! ingredient, :id, :content, :amount, :recipe_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
