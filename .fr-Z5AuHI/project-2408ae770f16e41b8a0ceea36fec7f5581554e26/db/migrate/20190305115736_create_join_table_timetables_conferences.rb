class CreateJoinTableTimetablesConferences < ActiveRecord::Migration[5.2]
  def change
    create_join_table :timetables, :conferences do |t|
      t.index [:timetable_id, :conference_id]
      t.index [:conference_id, :timetable_id]
    end
  end
end
