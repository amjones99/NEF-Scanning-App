# == Schema Information
#
# Table name: bookings
#
#  id                :bigint(8)        not null, primary key
#  access_req        :text
#  attended          :boolean
#  booking_reference :string
#  catering          :boolean
#  certificate       :boolean          default(FALSE)
#  dietary_req       :string
#  institution       :string
#  ticket_type       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  conference_id     :integer
#  user_id           :integer
#
# Indexes
#
#  bookings_booking_reference  (booking_reference) UNIQUE
#

class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :conference

  validates_presence_of :user, :ticket_type
  validates_uniqueness_of :booking_reference
  validates :booking_reference, length: { is: 9 }
end
