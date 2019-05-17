# == Schema Information
#
# Table name: conferences
#
#  id         :bigint(8)        not null, primary key
#  days       :integer
#  end_date   :date
#  location   :string
#  name       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :conference do
    id { 1 }
    days { 1 }
    name { "Conferencetest" }
    location { "MyString" }
    start_date { '2019-04-28 23:59:36.148336' }
    end_date { '2019-04-28 23:59:36.148336' }
  end
end
