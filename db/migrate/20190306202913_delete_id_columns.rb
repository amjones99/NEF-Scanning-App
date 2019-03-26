class DeleteIdColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :userid
    remove_column :conferences, :conf_id
    remove_column :events, :event_id
    remove_column :timetables, :session_id
    remove_column :users, :userid
  end
end
