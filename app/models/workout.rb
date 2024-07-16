class Workout < ApplicationRecord
  belongs_to :coach
  has_many :workout_sessions,dependent: :destroy
  has_many :members, through: :workout_sessions,dependent: :destroy
end