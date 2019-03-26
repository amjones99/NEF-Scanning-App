# == Schema Information
#
# Table name: timetables
#
#  id            :bigint(8)        not null, primary key
#  day_num       :integer
#  end_time      :time
#  start_time    :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  conference_id :integer
#  event_id      :integer
#

FactoryBot.define do
  factory :timetable do
    session_id { 1 }
    conf_id { 1 }
    event_id { 1 }
    day_num { 1 }
    start_time { "2019-02-26" }
    end_time { "2019-02-26" }
  end
end
