# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(email:
'user@a.a').first_or_create!(password:
'password', access: 1, username: 'user',  institution: 'Sheffield University', name: 'User', booking_reference: 11111 )

User.where(email:
'admin@a.a').first_or_create!(password:
'password', access: 1, username: 'admin', institution: 'Sheffield University', name: 'Adminstrator', booking_reference: 11112 )

User.where(email:
'delegate1@a.a').first_or_create!(password:
'password', access: 2, username: 'delegate', institution: 'Sheffield University', name: 'Delegate 1', booking_reference: 11113 )

User.where(email:
'delegate2@a.a').first_or_create!(password:
'password', access: 2, username: 'delegate2', institution: 'Sheffield University', name: 'Delegate 2', booking_reference: 11114 )

User.where(email:
'test@a.a').first_or_create!(password:
'password', access: 2, username: 'test', institution: 'Sheffield University', name: 'Test User', booking_reference: 11115 )

Conference.create(days: 2, name: 'conference 1', location: 'Sheffield Hallam')


Booking.create(booking_reference: 11111,institution: 'Sheffield University',
ticket_type: 2, access_req: 'f', catering: 'f', attended: 'f',
dietary_req: 'Nut allergy', user_id: 1, conference_id: 1)

Booking.create(booking_reference: 111112,institution: 'Sheffield University',
ticket_type: 2, access_req: 'f', catering: 'f', attended: 'f',
dietary_req: 'Vegan', user_id: 2, conference_id: 1)

Booking.create(booking_reference: 111113,institution: 'Sheffield University',
ticket_type: 2, access_req: 'f', catering: 'f', attended: 'f',
dietary_req: 'Vegetarian', user_id: 3, conference_id: 1)

Booking.create(booking_reference: 111114,institution: 'Sheffield University',
ticket_type: 2, access_req: 'f', catering: 'f', attended: 'f',
dietary_req: 'Water allergy', user_id: 4, conference_id: 1)

Booking.create(booking_reference: 111115,institution: 'Sheffield University',
ticket_type: 2, access_req: 'f', catering: 'f', attended: 'f',
dietary_req: 'Lactose Intolerant', user_id: 5, conference_id: 1)
