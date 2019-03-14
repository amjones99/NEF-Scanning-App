class RemoveConfIfTimetables < ActiveRecord::Migration[5.2]
  def change
    remove_column :timetables, :conf_id
  end
end
