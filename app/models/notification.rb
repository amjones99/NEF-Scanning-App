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

class Notification < ApplicationRecord
  validates :not_id, :not_des, presence: true
end
