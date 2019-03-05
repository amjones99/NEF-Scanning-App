# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  access     :integer
#  email      :string
#  name       :string
#  password   :string
#  userid     :integer
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_and_belongs_to_many :bookings
  validates :username, :access, :email, :name, presence: true
  validates :access, numericality: { greater_than: 0}
  validates :access, numericality: { lesser_than: 0} 
end
