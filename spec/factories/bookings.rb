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

FactoryBot.define do
  factory :booking do
    booking_reference { "" }
    userid { "" }
    institution { "MyString" }
    ticket_type { "" }
    access_req { false }
    catering { false }
    attended { false }
    dietary_req { "MyString" }
  end
end
