class AddColour2ToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :colour2, :string
  end
end
