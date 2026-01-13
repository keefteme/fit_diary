json.extract! measurement, :id, :weight, :waist, :hip, :date_taken, :user_id, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
