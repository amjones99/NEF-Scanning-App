# == Schema Information
#
# Table name: bookings
#
#  id                :bigint(8)        not null, primary key
#  access_req        :text
#  attended          :boolean
#  booking_reference :text
#  catering          :boolean
#  dietary_req       :string
#  institution       :string
#  ticket_type       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  conference_id     :integer
#  user_id           :integer
#

class Booking < ApplicationRecord
  require 'csv'
  belongs_to :user
  belongs_to :conference

  def self.import(file)
    csv = CSV.read(file.path, headers: true, skip_blanks: true)
    csv_valid = (['Name','Organisation','Email','Dietary Requirements', 'Access Requirements', 'IOP Competition', 'Registration Type',	'Registration Route', 'Early/Standard/Late',	'Income', 'Online Store Ref/ITO', 'Conference ID'] - csv.headers.compact).empty?


    CSV.foreach(file.path, headers: true, skip_blanks: true) do |b|

    return false unless csv_valid
    new_user = User.new
    new_user.name = b["Name"]
    new_user.email = b["Email"]
    new_user.username = "test123"
    new_user.access = 2
    new_user.password = 123456
    new_user.institution = b["Organisation"]
    new_user.save!

    new_booking = Booking.new
    new_booking.institution = b["Organisation"]
    new_booking.dietary_req = b["Dietary Requirements"]
    new_booking.access_req = b["Access Requirements"]
    new_booking.booking_reference = b["Online Store Ref/ITO"]
    new_booking.ticket_type = 1
    new_booking.catering = false
    new_booking.attended = false
    new_booking.user_id = new_user.id
    new_booking.conference_id = b["Conference ID"]
    new_booking.save!
    end
    return true
  end
  # CSV.foreach("/opt/ltsphome/acd17cm/Documents/MEMES.csv", headers: true) do |row|
end
