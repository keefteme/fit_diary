class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :calories
      t.float :proteins
      t.float :fats
      t.float :carbs
      t.references :food_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
