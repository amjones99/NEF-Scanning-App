class RemoveConfIdBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :conf_id 
  end
end
