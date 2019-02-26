# == Schema Information
#
# Table name: conferences
#
#  id         :bigint(8)        not null, primary key
#  days       :integer
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  conf_id    :integer
#

FactoryBot.define do
  factory :conference do
    conf_id { 1 }
    days { 1 }
    name { "MyString" }
    location { "MyString" }
  end
end
