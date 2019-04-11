class ChangeBookingRefTypeInBookings < ActiveRecord::Migration[5.2]

  def self.up
  change_column :bookings, :booking_reference, :text
  end

  def self.down
  change_column :bookings, :booking_reference, :integer
  end
end
