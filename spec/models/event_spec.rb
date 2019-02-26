# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  location   :string
#  name       :string
#  speaker    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
