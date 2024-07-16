class Member < ApplicationRecord
  belongs_to :coach
  has_many :workout_sessions,dependent: :destroy
  has_many :workouts, through: :workout_sessions,dependent: :destroy
end
