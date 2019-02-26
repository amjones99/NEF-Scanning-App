class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.integer :session_id
      t.integer :conf_id
      t.integer :event_id
      t.integer :day_num
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
