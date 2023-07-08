json.extract! public_recipe, :id, :name, :preparation_time, :cooking_time, :description, :public, :created_at,
              :updated_at
json.url public_recipe_url(public_recipe, format: :json)
