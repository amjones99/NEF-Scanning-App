require 'rails_helper'


describe 'Managing  admin features ' do
  specify 'I can log in as an admin ' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
  specify 'I can search for a booking with username' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t'
    FactoryBot.create :conference
    FactoryBot.create :booking
    FactoryBot.create :booking, id: 2, booking_reference: '172615241'
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    fill_in 'Search_username', with: 'testinguser'
    within(:css, 'table') {expect(page).to have_content 'testinguser'}
    within(:css, 'table') {expect(page).to_not have_content 'testuser2'}
  end
  specify 'I can search for a booking with username' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t'
    FactoryBot.create :conference
    FactoryBot.create :booking
    FactoryBot.create :booking, id: 2, booking_reference: '172615241'
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    fill_in 'Search_bref', with: '11111111'
    within(:css, 'table') {expect(page).to have_content 'testinguser'}
    within(:css, 'table') {expect(page).to_not have_content 'testuser2'}
  end
  specify 'I can search for a user with name' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t'
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Participants').click
    fill_in 'S-name', with: 'User12345'
    click_button 'Search'
    within(:css, 'table') {expect(page).to have_content 'testinguser'}
    within(:css, 'table') {expect(page).to_not have_content 'testuser2'}
  end
  specify 'I can search for a user with institution' do
    FactoryBot.create :user
    FactoryBot.create :user,id: 2, username:'test2' ,name: 'testuser2', email: 'test@test.t',institution: 'university of manchester'
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Participants').click
    fill_in 'S-institution', with: 'Sheffield university'
    click_button 'Search'
    within(:css, 'table') {expect(page).to have_content 'testinguser'}
    within(:css, 'table') {expect(page).to_not have_content 'testuser2'}
  end
  specify 'I can add new user' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Add User').click
    fill_in 'Username', with: 'user1'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'user1'
    click_button 'Create User'
    expect(page).to have_content 'User was successfully created'
    page.find('#wrap').find_link('Participants').click
    expect(page).to have_content 'user1'
  end

  specify 'I can edit a user' do
    FactoryBot.create :user
    visit '/users'
    expect(page).to have_content 'Password'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'usertest'
    click_button 'Update User'
    expect(page).to have_content 'usertest'
  end

  specify 'I can see a list of users' do
    user1 = FactoryBot.create :user, name: 'testuser2', email: 'test@test.t'
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    within(:css, 'table') {expect(page).to have_content 'testuser2'}
  end

  specify 'I can delete users' do
    FactoryBot.create :user, name: 'deleteuser', email: 'test@test.t'
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Destroy'
    expect(page).to_not have_content 'deleteuser'
  end

  specify 'I cant access user pages as an admin ' do
    user1 = FactoryBot.create :user, name: 'User1', email: 'test@test.t'
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    visit '/users/indexU'
    expect(page).to have_content 'All users'
  end
  specify 'I change a user to attended ' do
    FactoryBot.create :user
    FactoryBot.create :conference
    FactoryBot.create :booking
    visit '/bookings'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Toggle Attended'
    expect(page).to have_content 'Booking was successfully updated.'
  end
  specify 'I can see a badge ' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Badge'
    expect(page).to have_content 'Badge'
  end
  specify 'I can add a timetable' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Timetables'
    expect(page).to have_content 'Listing Timetable'
    click_link 'New Timetable'
    expect(page).to have_content 'New Session'
  end
  # specify 'I can delete a timetable' do
  #   FactoryBot.create :user
  #   FactoryBot.create :timetable
  #   visit '/users'
  #   fill_in 'Username', with:'testinguser'
  #   fill_in 'Password', with:'password'
  #   click_button 'Log in'
  #   click_link 'Timetables'
  #   expect(page).to have_content 'Listing Timetable'
  #   click_link 'Destroy'
  #   expect(page).to have_content ' Timetable was successfully destroyed.'
  # end
  specify 'I can not access the user page' do
    FactoryBot.create :user
    visit '/users/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    visit '/users/indexU'
    expect(page).to_not have_content 'Homepage'
  end
  specify 'I can sort bookings' do
    FactoryBot.create :user
    FactoryBot.create :user, id: 2, username:'test1' ,name: 'testuser1', email: 'test@test.t1', access: 2
    FactoryBot.create :user,id: 3, username:'test2' ,name: 'testuser2', email: 'test@test.t2', access: 2
    FactoryBot.create :user,id: 4, username:'test3' ,name: 'testuser3', email: 'test@test.t2', access: 2
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link "User"
    expect('/bookings?q%5Bs%5D=user_id+asc')
    end
end
