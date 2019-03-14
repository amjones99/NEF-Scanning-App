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
  belongs_to :timetable
  has_many :booking

  validates :days, :name, :location, presence: true

end
