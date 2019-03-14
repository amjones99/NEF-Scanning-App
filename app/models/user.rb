# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  access     :integer
#  email      :string
#  name       :string
#  password   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booking_id :integer
#

class User < ApplicationRecord
  belongs_to :booking
  validates :username, :password, :access, :email, :name, presence: true
  validates :access, numericality: { less_than: 4}
  validates :access, numericality: { greater_than: 0}
end
