# == Schema Information
#
# Table name: bookings
#
#  id                :bigint(8)        not null, primary key
#  access_req        :text
#  attended          :boolean
#  booking_reference :text
#  catering          :boolean
#  certificate       :boolean
#  dietary_req       :string
#  institution       :string
#  ticket_type       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  conference_id     :integer
#  user_id           :integer
#

class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :conference

  validates_presence_of :user
end
