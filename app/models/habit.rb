class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_slots, dependent: :destroy
  after_create :create_habit_slots
  after_update :update_habit_slots

  def set_favourite(favourite)
    self.favourite = favourite.save
  end

  def weekdays
    @weekdays = []
    @weekdays << 0 if self.monday == true
    @weekdays << 1 if self.tuesday == true
    @weekdays << 2 if self.wednesday == true
    @weekdays << 3 if self.thursday == true
    @weekdays << 4 if self.friday == true
    @weekdays << 5 if self.saturday == true
    @weekdays << 6 if self.sunday == true
    @weekdays
  end

  def create_habit_slots
    dates = self.dates
    dates.each { |date| HabitSlot.create(habit_id: id, start_time: date) }
  end

  def update_habit_slots
    dates = self.dates
    habitslots = HabitSlot.where(habit_id: id)
    habitslots.each { |habitslot| habitslot.destroy }
    dates.each { |date| HabitSlot.create(habit_id: id, start_time: date) }
  end

  def dates
    dates = (start_date..end_date).to_a
    @filtered_dates = []
    dates.each do |date|
      weekdays.each { |weekday| @filtered_dates << date if weekday == date.wday }
    end
    @filtered_dates
  end

  def calculate_completed
    total_habitslots = HabitSlot.where(habit_id: id, user: current_user)
    completed_habitslots = HabitSlot.where(habit_id: id, user: current_user, completed: true)
    @habitslot_progress = completed_habitslots / total_habitslots
  end

  def calculate_habit_completion_rate_for_habit(id)
    habit = Habit.find(id)
    total_habitslots_count = habit.habit_slots.count
    completed_habitslots_count = 0
    habit.habit_slots.each do |habitslot|
        completed_habitslots_count += 1 if habitslot.completed == true
    end
    if total_habitslots_count > 0
      (completed_habitslots_count / total_habitslots_count) * 100
    else
      0
    end
  end

  def generategradient
    habit = Habit.find(id)
    @str = "lineargradient(90deg,#{habit.colour1}, #{habit.colour1});"
    @str
  end
end
