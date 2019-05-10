class AddCertificateOfAttendanceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :certificate, :boolean
  end
end
