class AddMemberLastWorkoutTime < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :last_workout_time, :datetime
  end
end
