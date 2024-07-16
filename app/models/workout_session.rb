class WorkoutSession < ApplicationRecord
  belongs_to :workout
  belongs_to :member
  belongs_to :coach
end
