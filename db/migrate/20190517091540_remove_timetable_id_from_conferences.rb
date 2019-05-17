class RemoveTimetableIdFromConferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :conferences, :timetables_id, :int
  end
end
