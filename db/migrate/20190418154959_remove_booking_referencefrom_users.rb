class RemoveBookingReferencefromUsers < ActiveRecord::Migration[5.2]
  def down
    add_column :users, :booking_reference, :text
  end
end
