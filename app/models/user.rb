class User < ApplicationRecord
  has_many :habits
  has_many :calendars
  has_many :habit_slots, through: :habits
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def calculate_habit_completion_rate
    all_habit_slots = self.habit_slots
    completed_habit_slots = all_habit_slots.completed

    if completed_habit_slots.empty? || all_habit_slots.empty?
      return 0
    end

    result = completed_habit_slots.count.fdiv(all_habit_slots.count) * 100
    result.round
  end
end
