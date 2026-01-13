class CreateMeasurements < ActiveRecord::Migration[8.1]
  def change
    create_table :measurements do |t|
      t.float :weight
      t.float :waist
      t.float :hip
      t.date :date_taken
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
