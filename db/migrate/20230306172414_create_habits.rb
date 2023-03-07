class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :title
      t.text :description
      t.boolean :favourite, default: false
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :repeat, default: false
      t.boolean :monday, default: false
      t.boolean :tuesday, default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday, default: false
      t.boolean :friday, default: false
      t.boolean :saturday, default: false
      t.boolean :sunday, default: false

      t.timestamps
    end
  end
end
