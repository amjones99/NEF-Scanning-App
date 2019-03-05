# == Schema Information
#
# Table name: notifications
#
#  id         :bigint(8)        not null, primary key
#  not_des    :string
#  time       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  not_id     :string
#

class Notification < ApplicationRecord
  validates :note_id, :not_des, :time, presence: true
end
