class RemoveColumnsFromTimetables < ActiveRecord::Migration[5.2]
  def up
    remove_column :timetables, :event_id
    remove_column :timetables, :day_num
    remove_column :timetables, :conference_id
    remove_column :timetables, :start_time
    remove_column :timetables, :end_time
  end

  def down
    add_column :timetables, :event_id, :integer
    add_column :timetables, :day_num, :integer
    add_column :timetables, :conference_id, :integer
    add_column :timetables, :start_time, :time
    add_column :timetables, :end_time, :time
  end
end
