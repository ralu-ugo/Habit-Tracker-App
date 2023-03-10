class HabitSlot < ApplicationRecord
  belongs_to :habit
  has_many :users, through: :habit

  def complete
    self.completed = true
  end

  def incomplete
    self.completed = false
  end
end
