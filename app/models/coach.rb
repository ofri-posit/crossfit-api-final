class Coach < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :workout_sessions, through: :workouts, dependent: :destroy

  # Validations

  # Vawlidates the presence of the name attribute and its length with a custom error message
  validates :name, presence: true, length: { minimum: 2, maximum: 50, message: "name length must be between 2 and 50 characters" }

  #Validates the presence of the email attribute and makes sure it is valid using a regex and return custom error message
  validates :email,
            presence: { message: "Email can't be blank" },
            uniqueness: { message: "Email has already been taken" },
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email must be valid" }
end
