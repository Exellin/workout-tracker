class Exercise < ApplicationRecord
  belongs_to :user
  
  alias_attribute :Workout_Details, :workout
  alias_attribute :Activity_Date, :workout_date
  
  validates :duration_in_min, numericality: { greater_than: 0.0 }
  validates :Workout_Details, presence: true
  validates :Activity_Date, presence: true
end
