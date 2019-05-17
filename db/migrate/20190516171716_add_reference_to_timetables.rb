class AddReferenceToTimetables < ActiveRecord::Migration[5.2]
  def change
    add_column :timetables, :conference_id, :integer
    add_column :conferences, :timetables_id, :integer
  end
end
