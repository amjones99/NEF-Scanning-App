class ReferenceUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :booking_reference, :string, unique: true
  end
end
