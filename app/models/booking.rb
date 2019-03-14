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
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  conference_id     :integer
#  user_id           :integer
#

class Booking < ApplicationRecord
  has_many :user
  has_one :conference
end
