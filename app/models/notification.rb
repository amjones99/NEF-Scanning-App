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
<<<<<<< HEAD
  validates :note_id, :not_des, :time, presence: true
=======
  validates :not_id, :not_des, :time, presence: true
>>>>>>> a73a4ea6c351f1d9e7985d0c7ec1171fe7c1d183
end
