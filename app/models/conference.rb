# == Schema Information
#
# Table name: conferences
#
#  id         :bigint(8)        not null, primary key
#  days       :integer
#  end_date   :date
#  location   :string
#  name       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conference < ApplicationRecord
  has_many :timetable
  has_many :booking
  
  validates :days, :name, :location, presence: true
  validates :days, numericality: { greater_than: 0}
  validates_date :end_date, :on_or_after => :start_date, :on_or_after_message => 'The conference cannot end before the start date'
end
