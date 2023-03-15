class AddColour1ToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :colour1, :string
  end
end
