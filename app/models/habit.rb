class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_slots
  after_create :create_habit_slots

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

  def change_date(date)
    self.start_date = date
  end

  def create_habit_slots
    # create a habitslots associate it to this habit

    # look at habit and run algorithm
    # create as many habit slots as needed as per algorithm
    # associate habitslots to this habit
  end
end
