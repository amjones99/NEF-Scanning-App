class AddTimetableToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :timetable_id, :integer
  end
end
