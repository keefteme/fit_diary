json.extract! food_entry, :id, :weight_grams, :date_eaten, :user_id, :product_id, :meal_type_id, :created_at, :updated_at
json.url food_entry_url(food_entry, format: :json)
