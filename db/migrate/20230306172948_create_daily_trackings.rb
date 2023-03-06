class CreateDailyTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_trackings do |t|

      t.timestamps
    end
  end
end
