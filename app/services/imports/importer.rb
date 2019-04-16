class Imports::Importer

  def initialize(file)
    @path = file.path
  end

  def import
    # csv = CSV.read("/opt/ltsphome/acd17cm/Documents/MEMES.csv", :headers=>true, skip_blanks: true)
    # csv = CSV.read(@path, headers: true, skip_blanks: true)
    csv_valid = (['Name','Organisation','Email','Dietary Requirements', 'Access Requirements', 'IOP Competition', 'Registration Type',	'Registration Route', 'Early/Standard/Late',	'Income', 'Online Store Ref/ITO', 'Conference ID'] - csv.headers.compact).empty?
    return false unless csv_valid

    csv.each do |u|
    new_user = User.new
    new_user.name = u["Name"]
    new_user.email = u["Email"]
    new_user.username = "test"
    new_user.access = 1
    new_user.password = "test"
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
    new_conference_id = b["Conference ID"]
    new_booking.save!
    end
    return true
  end

end
