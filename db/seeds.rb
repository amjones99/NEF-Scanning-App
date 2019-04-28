# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(email:
'user@a.a').first_or_create!(password:
'password', access: 1, username: 'user',  institution: 'Sheffield University', name: 'User')

User.where(email:
'admin@a.a').first_or_create!(password:
'password', access: 1, username: 'admin', institution: 'Sheffield University', name: 'Adminstrator')

User.where(email:
'delegate1@a.a').first_or_create!(password:
'password', access: 2, username: 'delegate', institution: 'Sheffield University', name: 'Delegate 1')

User.where(email:
'delegate2@a.a').first_or_create!(password:
'password', access: 2, username: 'delegate2', institution: 'Sheffield University', name: 'Delegate 2')

User.where(email:
'test@a.a').first_or_create!(password:
'password', access: 2, username: 'test', institution: 'Sheffield University', name: 'Test User')

Conference.create(days: 2, name: 'conference 1', location: 'Sheffield Hallam')


Booking.create(booking_reference: '111111111',institution: 'Sheffield University',
ticket_type: 2, access_req: 'Wheelchair Access', catering: 'f', attended: 'f',
dietary_req: 'Nut allergy', user_id: 1, conference_id: 1)

Booking.create(booking_reference: '111111112',institution: 'Sheffield University',
ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Vegan', user_id: 2, conference_id: 1)

Booking.create(booking_reference: '111111113',institution: 'Sheffield University',
ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Vegetarian', user_id: 3, conference_id: 1)

Booking.create(booking_reference: '111111114',institution: 'Sheffield University',
ticket_type: 2, access_req: '', catering: 'f', attended: 'f',
dietary_req: 'Water allergy', user_id: 4, conference_id: 1)

Booking.create(booking_reference: '111111115',institution: 'Sheffield University',
ticket_type: 2, access_req: 'Braille Needed', catering: 'f', attended: 'f',
dietary_req: 'Lactose Intolerant', user_id: 5, conference_id: 1)

Notification.create(not_id: 'Test Notification', not_des: 'Hello World')
