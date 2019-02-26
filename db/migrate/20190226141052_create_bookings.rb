class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :booking_reference
      t.integer :userid
      t.string :institution
      t.integer :ticket_type
      t.boolean :access_req
      t.boolean :catering
      t.boolean :attended
      t.string :dietary_req

      t.timestamps
    end
  end
end
