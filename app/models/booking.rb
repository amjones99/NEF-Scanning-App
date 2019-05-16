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

class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :conference

<<<<<<< HEAD
  validates_presence_of :user, :ticket_type
  validates_uniqueness_of :booking_reference
  validates :booking_reference, length: { is: 9 }
=======
  validates_presence_of :user, :institution, :ticket_type
  #validates_uniqueness_of :booking_reference
  #validates :booking_reference, length: { is: 9 }
>>>>>>> ba34174abb9081c1f98bc0873ad7511384c90813
end
