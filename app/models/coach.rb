class Coach < ApplicationRecord
  has_many :members,dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :workout_sessions, through: :workouts,dependent: :destroy
end
