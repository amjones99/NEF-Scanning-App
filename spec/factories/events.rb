# == Schema Information
#
# Table name: events
#
#  id           :bigint(8)        not null, primary key
#  desc         :string
#  location     :string
#  name         :string
#  speaker      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  timetable_id :integer
#

FactoryBot.define do
  factory :event do
    event_id { 1 }
    name { "MyString" }
    speaker { "MyString" }
    location { "MyString" }
    desc { "MyString" }
  end
end
