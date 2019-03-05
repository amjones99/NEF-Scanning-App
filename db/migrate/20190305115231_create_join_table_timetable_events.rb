class CreateJoinTableTimetableEvents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :timetables, :events do |t|
      t.index [:timetable_id, :event_id]
      t.index [:event_id, :timetable_id]
    end
  end
end
