require 'rails_helper'

describe 'Managing  bookings as an admin ' do
  specify 'I can add a new booking ' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t', access: 2
    FactoryBot.create :conference
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'New Booking'
    click_link 'Create Booking for user'
    fill_in 'Booking reference', with: '123456789'
    fill_in 'Institution', with: 'Sheffield'
    fill_in 'Number of Days', with: '2'
    select 'Conferencetest', from: "Conference"
    select 'testuser2', from: "User"
    click_button 'Create Booking'
    expect(page).to have_content 'Booking was successfully created'
  end
  specify 'I can edit booking ' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t', access: 2
    FactoryBot.create :conference
    FactoryBot.create :booking
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Institution', with: 'Sheffield'
    click_button 'Update Booking'
    within(:css, 'table') {expect(page).to have_content 'Sheffield'}
  end
  specify 'I can destroy booking ' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t', access: 2
    FactoryBot.create :conference
    FactoryBot.create :booking
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Destroy'
    within(:css, 'table') {expect(page).to_not have_content '123456789'}
  end
  

end
