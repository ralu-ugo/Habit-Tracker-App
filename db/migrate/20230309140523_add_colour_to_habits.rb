class AddColourToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :colour, :string
  end
end
