class ChangeStartToDatetimeInWorkouts < ActiveRecord::Migration[7.1]
  def change
    change_column :workouts, :start, :datetime
  end
end
