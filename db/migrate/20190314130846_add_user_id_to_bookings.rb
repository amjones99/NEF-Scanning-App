class AddUserIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :user_id, :integer
    add_column :users, :booking_id, :integer  
  end
end
