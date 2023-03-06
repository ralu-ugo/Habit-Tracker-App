class CreateDailyTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_tracks do |t|
      t.boolean :completed
      t.date :completion_date
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
