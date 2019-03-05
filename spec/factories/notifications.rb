# == Schema Information
#
# Table name: notifications
#
#  id         :bigint(8)        not null, primary key
#  not_des    :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  not_id     :string
#

FactoryBot.define do
  factory :notification do
    not_id { "MyString" }
    not_des { "MyString" }
    time { "2019-03-05" }
  end
end
