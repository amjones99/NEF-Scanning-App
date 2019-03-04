class AddConfIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :conf_id, :integer
  end
end
