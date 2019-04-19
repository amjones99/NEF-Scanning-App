class RemoveBookingReferenceFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :booking_reference, :string
  end
end
