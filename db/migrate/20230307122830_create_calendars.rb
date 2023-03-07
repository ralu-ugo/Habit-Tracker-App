class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.date :calendar_start_date
      t.date :calendar_end_date
      t.string :calendar_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
