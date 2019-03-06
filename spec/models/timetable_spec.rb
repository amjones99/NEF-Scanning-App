# == Schema Information
#
# Table name: timetables
#
#  id         :bigint(8)        not null, primary key
#  day_num    :integer
#  end_time   :date
#  start_time :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  conf_id    :integer
#  event_id   :integer
#

require 'rails_helper'

RSpec.describe Timetable, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
