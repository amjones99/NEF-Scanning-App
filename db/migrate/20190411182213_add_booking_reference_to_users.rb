class AddBookingReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :booking_reference, :string
  end
end
