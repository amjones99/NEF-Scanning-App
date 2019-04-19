class RemoveBookingReferencefromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :booking_reference
  end

  def down
    add_column :users, :booking_reference, :text
  end
end
