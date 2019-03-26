class RemoveBookingIdConf < ActiveRecord::Migration[5.2]
  def change
    remove_column :conferences, :booking_id
  end
end
