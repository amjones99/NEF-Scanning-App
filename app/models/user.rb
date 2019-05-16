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
#  temp_pw                :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  require 'csv'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :recoverable
  validates_format_of    :email,    :with  => Devise.email_regexp
  validates_length_of    :password, :within => Devise.password_length, on: :create
  validates_length_of    :password, :within => Devise.password_length, on: :changepw
  validates_length_of    :password, :within => Devise.password_length, on: :editAdmin
  validates_uniqueness_of    :username,     :case_sensitive => true
  has_many :booking
  validates :username, :password, :access, :email, :name, presence: true, on: :create
  validates :username, :password , :confirmation => true, :length =>{:within => 4..40}, on: :create
#  validates :username, :password , :confirmation => true, :length =>{:within => 6..40}
  validates_confirmation_of :password




  def self.UserGen(name, email)
    emailName = email.split("@").first
    @usrnm = emailName.to_s + name.first.to_s + name.last.to_s
    @usersomething = User.where("username ~* ?", @usrnm)
    if (@usersomething.length != 0)
      return @usrnm + @usersomething.length.to_s
    else
      return @usrnm
    end
  end


  def self.import(file)
    csv = CSV.read(file.path, headers: true, skip_blanks: true)
    CSV.foreach(file.path, headers: true, skip_blanks: true) do |b|
    csv_valid = (['Name','Organisation','Email','Dietary Requirements', 'Access Requirements', 'Catering', 'Number of Days', 'Online Store Ref/ITO'] - csv.headers.compact).empty?
    return false unless csv_valid

    new_user = User.new
    new_user.name = b["Name"]
    new_user.email = b["Email"]
    # hard coded username. this is where we need to generate it automatically.
    new_user.username = UserGen(b["Name"],b["Email"])
    new_user.access = 2
    # hard coded password. this is where we need to generate it automatically.
    pw = SecureRandom.hex(8)
    new_user.password = pw
    new_user.institution = b["Organisation"]
    new_user.temp_pw = pw
    new_user.save!


    new_booking = Booking.new
    new_booking.institution = b["Organisation"]
    new_booking.dietary_req = b["Dietary Requirements"]
    new_booking.access_req = b["Access Requirements"]
    new_booking.booking_reference = b["Online Store Ref/ITO"]
    new_booking.ticket_type = b["Number of Days"]
    catering = b["Catering"]
    if catering == "Yes" || catering == "yes"
      new_booking.catering = true
    else
      new_booking.catering = false
    end
    new_booking.attended = false
    new_booking.user_id = new_user.id
    # check Easter Week 2 for issue about conference ID pls.
    new_booking.conference_id = b["Conference ID"]
    new_booking.save!

    UserMailer.welcome_email(new_user).deliver
    end
    return true
  end


end
