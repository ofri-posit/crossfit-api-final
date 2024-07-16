class CreateWorkoutSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_sessions do |t|
      t.integer :workout_id
      t.integer :member_id
      t.integer :coach_id

      t.timestamps
    end
  end
end
