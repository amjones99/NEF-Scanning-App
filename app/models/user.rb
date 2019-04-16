# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  access                 :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  institution            :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  manager                :boolean
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  has_many :booking
  validates :username, :password, :access, :email, :name, presence: true, on: new
  validates :access, numericality: { less_than: 4}
  validates :access, numericality: { greater_than: 0}




end
