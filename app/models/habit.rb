class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_slots, dependent: :destroy
  after_create :create_habit_slots
  after_update :update_habit_slots

  private

  def weekdays
    @weekdays = []
    if self.monday == true
      @weekdays << 1
    elsif self.tuesday == true
      @weekdays << 2
    elsif self.wednesday == true
      @weekdays << 3
    elsif self.thursday == true
      @weekdays << 4
    elsif self.friday == true
      @weekdays << 5
    elsif self.saturday == true
      @weekdays << 6
    elsif self.sunday == true
      @weekdays << 7
    end
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

  def favourite
    self.favourite = true
  end
end
