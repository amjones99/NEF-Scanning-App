class ChangeAccessReqTypeInBookings < ActiveRecord::Migration[5.2]
    def self.up
    change_column :bookings, :access_req, :text
    end

    def self.down
    change_column :bookings, :access_req, :boolean
    end

end
