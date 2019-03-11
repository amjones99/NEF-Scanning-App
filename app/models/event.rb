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
#

class Event < ApplicationRecord
  has_and_belongs_to_many :timetables
<<<<<<< HEAD

=======
>>>>>>> a73a4ea6c351f1d9e7985d0c7ec1171fe7c1d183
  validates :name, :speaker, :location, :desc, presence: true
end
