require 'rails_helper'

describe 'Managing  bookings as an admin ' do
  specify 'I can add a new booking ' do
    FactoryBot.create :user
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
    expect(page).to have_content 'Signed in successfully'
  end


end
