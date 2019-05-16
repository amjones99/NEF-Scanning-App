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

FactoryBot.define do
  factory :booking do
    id { "1" }
    booking_reference { "123456789" }
    user_id { "1" }
    institution { "Univerity of Sheffield" }
    ticket_type { "2" }
    access_req { false }
    catering { false }
    certificate { false }
    attended { false }
    dietary_req { "disabled" }
    conference_id { "1" }
  end
end
