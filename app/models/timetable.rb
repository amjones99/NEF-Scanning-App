# == Schema Information
#
# Table name: timetables
#
#  id                   :bigint(8)        not null, primary key
#  timetable_image_file :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Timetable < ApplicationRecord
  mount_uploader :timetable_image_file, TimetableImageUploader

  validates :timetable_image_file, presence: true
end
