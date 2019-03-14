# == Schema Information
#
# Table name: timetables
#
#  id            :bigint(8)        not null, primary key
#  day_num       :integer
#  end_time      :date
#  start_time    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  conference_id :integer
#  event_id      :integer
#

class Timetable < ApplicationRecord
  has_one :event
  has_one :conference

  validates :conference_id, :event_id, :day_num, :start_time, :end_time, presence: true
end
