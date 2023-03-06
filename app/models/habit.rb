class Habit < ApplicationRecord
  belongs_to :user
  has_many :daily_trackings
  has_many :schedules
end
