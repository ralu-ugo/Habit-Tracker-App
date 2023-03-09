class AddEverydayToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :everyday, :boolean
  end
end
