class AddForeignKeyToTimetables < ActiveRecord::Migration[5.2]
  def change
    add_reference :timetables, :conferences
  end
end
