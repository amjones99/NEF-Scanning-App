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
#  conf_id           :integer
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
