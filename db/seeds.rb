# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(username:
'user').first_or_create!(email:
'user@a.a', password: 'password', access: 1,  institution: 'Sheffield University', name: 'User')

User.where(username:
'admin').first_or_create!(password:
'password', email: 'admin@a.a', access: 1, institution: 'Sheffield University', name: 'Adminstrator')

User.where(username:
'delegate').first_or_create!(password:
'password', access: 2, email: 'delegate1@a.a', institution: 'Sheffield University', name: 'Delegate 1')

User.where(username:
'delegate2').first_or_create!(password:
'password', access: 2, email: 'delegate2@a.a', institution: 'Sheffield University', name: 'Delegate 2')

User.where(username:
'test').first_or_create!(password:
'password', access: 2, email: 'test@a.a', institution: 'Sheffield University', name: 'Test User')

Conference.where(name:
'NEF Conference').first_or_create!(days:
2, location: 'Sheffield Hallam')


Booking.where(booking_reference:
'111111111').first_or_create!(institution:
'Sheffield University', ticket_type: 2, access_req: 'Wheelchair Access', catering: 'f',
attended: 'f', dietary_req: 'Nut allergy', user_id: 1, conference_id: 1)

Booking.where(booking_reference:
'111111112').first_or_create!(institution:
'Sheffield University', ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Vegan', user_id: 2, conference_id: 1)

Booking.where(booking_reference: '111111113').first_or_create!(institution: 'Sheffield University',
ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Vegetarian', user_id: 3, conference_id: 1)

Booking.where(booking_reference: '111111114').first_or_create!(institution: 'Sheffield University',
ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Water allergy', user_id: 4, conference_id: 1)

Booking.where(booking_reference: '111111115').first_or_create!(institution: 'Sheffield University',
ticket_type: 2, access_req: 'Braille Needed', catering: 'f', attended: 'f',
dietary_req: 'Lactose Intolerant', user_id: 5, conference_id: 1)

Notification.where(not_id: 'Test Notification').first_or_create!(not_des: 'Hello World')
