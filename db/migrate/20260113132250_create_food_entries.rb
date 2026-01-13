class CreateFoodEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :food_entries do |t|
      t.integer :weight_grams
      t.date :date_eaten
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :meal_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
