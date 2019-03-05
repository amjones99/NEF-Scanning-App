# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  location   :string
#  name       :string
#  speaker    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

class Event < ApplicationRecord
  has_and_belongs_to_many :timetables

  validates :name, :speaker, :location, :desc, presence: true
end
