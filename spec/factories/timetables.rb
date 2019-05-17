# == Schema Information
#
# Table name: timetables
#
#  id                   :bigint(8)        not null, primary key
#  timetable_image_file :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  conference_id        :integer
#

FactoryBot.define do
  factory :timetable do
    timetable_image_file { Rack::Test::UploadedFile.new(Rails.root.join('spec/timetable(1).jpg'), 'image/jpeg') }
    conference_id { 1 }
  end
end
