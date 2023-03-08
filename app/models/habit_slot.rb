class HabitSlot < ApplicationRecord
  belongs_to :habit

  def completed
    self.completed = true
  end

  def incomplete
    self.completed = false
  end
end
