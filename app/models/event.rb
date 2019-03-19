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

class Event < ApplicationRecord
  has_many :timetable
  validates :name, :speaker, :location, :desc, presence: true
end
