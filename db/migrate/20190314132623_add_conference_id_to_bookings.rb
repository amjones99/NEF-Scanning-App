class AddConferenceIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :conference_id, :integer
    add_column :conferences, :booking_id, :integer
  end
end
