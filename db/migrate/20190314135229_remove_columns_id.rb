class RemoveColumnsId < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :booking_id
    remove_column :events, :timetable_id
    remove_column :conferences, :timetable_id
  end
end
