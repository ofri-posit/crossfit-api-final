class Member < ApplicationRecord
  belongs_to :coach
  has_many :workout_sessions, dependent: :destroy
  has_many :workouts, through: :workout_sessions, dependent: :destroy

  # Validations

  # Vawlidates the presence of the name attribute and its length with a custom error message
  validates :name,
            presence: { message: "Name can't be blank" },
            uniqueness: { message: "Name has already been taken" },
            length: { minimum: 2, maximum: 50, message: "name length must be between 2 and 50 characters" }

  validates :email,
            presence: { message: "Email can't be blank" },
            uniqueness: { message: "Email has already been taken" },
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email must be valid" }
  #Validates the presence of the coach_id attribute and make sure it is an integer and make sure there isa coach with that id in the database
  validates :coach_id,
            presence: { message: "Coach ID can't be blank" },
            numericality: { only_integer: true, message: "Coach ID must be an integer" },
            inclusion: { in: ->(member) { member.coach_ids }, message: "coach_id must be valid" }
end
