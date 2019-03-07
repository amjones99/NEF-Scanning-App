class CreateJoinTableBookingsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :bookings, :users, force: true do |t|
      t.index [:booking_id, :user_id]
      t.index [:user_id, :booking_id]
    end
  end
end
