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
#

class User < ApplicationRecord
  has_and_belongs_to_many :bookings
<<<<<<< HEAD

  validates :username, :password, :access, :email, :name, presence: true
  validates :access, numericality: { less_than: 4}
  validates :access, numericality: { greater_than: 0}
  

=======
  validates :username, :access, :email, :name, presence: true
  validates :access, numericality: { greater_than: 0}
  validates :access, numericality: { lesser_than: 0} 
>>>>>>> a73a4ea6c351f1d9e7985d0c7ec1171fe7c1d183
end
