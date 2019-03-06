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
#  conf_id           :integer
#

class Booking < ApplicationRecord
  has_and_belongs_to_many :users
end
