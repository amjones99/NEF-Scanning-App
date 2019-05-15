class ChangeCertificateOfAttendanceOrderInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :certificate, :boolean, after: :catering, default: false
  end
end
