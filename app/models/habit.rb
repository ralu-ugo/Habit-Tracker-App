class Habit < ApplicationRecord
  belongs_to :user
  has_many :daily_tracks

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
end
