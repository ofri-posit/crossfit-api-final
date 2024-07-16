class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.date :start
      t.integer :duration
      t.references :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
