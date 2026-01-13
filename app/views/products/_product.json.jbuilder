json.extract! product, :id, :name, :calories, :proteins, :fats, :carbs, :food_category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
