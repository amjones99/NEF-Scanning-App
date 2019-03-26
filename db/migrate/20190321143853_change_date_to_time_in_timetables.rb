class ChangeDateToTimeInTimetables < ActiveRecord::Migration[5.2]
  def change
    remove_column :timetables, :start_time
    remove_column :timetables, :end_time
    add_column :timetables, :start_time, :time
    add_column :timetables, :end_time, :time
  end
end
