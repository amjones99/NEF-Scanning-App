# == Schema Information
#
# Table name: bookings
#
#  id                :bigint(8)        not null, primary key
#  access_req        :boolean
#  attended          :boolean
#  booking_reference :integer
#  catering          :boolean
#  dietary_req       :string
#  institution       :string
#  ticket_type       :integer
#  userid            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Booking < ApplicationRecord
end
