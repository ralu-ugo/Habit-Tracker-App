class User < ApplicationRecord
  has_many :habits
  has_many :calendars
  has_many :habit_slots, through: :habit
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def calculate_habit_completion_rate
    total_habits = Habit.where(user_id: id)
    total_habitslots_count = 0
    completed_habitslots_count = 0
    total_habits.each do |habit|
      total_habitslots_count += habit.habit_slots.count
    end
    total_habits.each do |habit|
      habit.habit_slots.each do |habitslot|
        completed_habitslots_count += 1 if habitslot.completed == true
      end
    end
    (completed_habitslots_count / total_habitslots_count) * 100 unless total_habitslots_count == 0
  end
end
