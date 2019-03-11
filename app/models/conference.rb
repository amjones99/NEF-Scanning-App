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
#

class Conference < ApplicationRecord
  has_one :timetable
  has_many :events, through: :timetable

<<<<<<< HEAD
  validates :days, :name, :location, presence: true 
=======
  validates :days, :name, :location, presence: true
>>>>>>> a73a4ea6c351f1d9e7985d0c7ec1171fe7c1d183
end
