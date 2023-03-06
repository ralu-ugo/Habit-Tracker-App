class Habit < ApplicationRecord
  belongs_to :user
  has_many :daily_tracks
  has_many :schedules
end
