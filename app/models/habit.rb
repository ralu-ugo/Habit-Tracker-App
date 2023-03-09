class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_slots, dependent: :destroy
  after_create :create_habit_slots
  after_update :update_habit_slots

  private

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
end
