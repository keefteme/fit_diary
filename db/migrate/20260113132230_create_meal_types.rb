class CreateMealTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
