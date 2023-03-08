class CreateHabitSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_slots do |t|
      t.references :habit, null: false, foreign_key: true
      t.boolean :completed
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
