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

  validates :days, :name, :location, presence: true

end
