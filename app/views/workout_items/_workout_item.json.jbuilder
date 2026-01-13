json.extract! workout_item, :id, :comment, :workout_id, :exercise_id, :created_at, :updated_at
json.url workout_item_url(workout_item, format: :json)
