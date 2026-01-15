class CreateWorkoutSets < ActiveRecord::Migration[8.1]
  def change
    create_table :workout_sets do |t|
      t.float :weight
      t.integer :reps
      t.references :workout_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
