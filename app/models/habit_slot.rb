class HabitSlot < ApplicationRecord
  belongs_to :habit
  has_one :user, through: :habit

  def completed
    self.completed = true
  end

  def incomplete
    self.completed = false
  end
end
