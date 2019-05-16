require 'rails_helper'


describe 'Managing user' do
  specify 'I can log in as an user ' do
    FactoryBot.create :user, access:2
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
  specify 'I can edit my account' do
    FactoryBot.create :user, access:2
    visit '/users/account'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit Account'
    fill_in 'Username', with: 'user'
    #fill_in 'Password', with: 'password'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'tesingupdate'
    click_button 'Update User'
    expect(page).to have_content 'User was successfully updated'
  end
  specify 'I cant access admin pages as a user' do
    FactoryBot.create :user, access: 2
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    expect(page).to have_content 'Homepage'
  end
  specify 'I can see a map ' do
    FactoryBot.create :user, access: 2
    visit '/users/map'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    have_css("img[src*='/map.jpg']")
  end
#   specify 'I can see a timetable ' do
#     FactoryBot.create :user, access: 2
#     visit '/users'
#     fill_in 'Username', with:'testinguser'
#     fill_in 'Password', with:'password'
#     click_button 'Log in'
# end
  specify 'I can see a badge ' do
    FactoryBot.create :user, access: 2
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Badge'
    expect(page).to have_content 'Badge'
  end
  specify 'I can request a certificate of attendance' do
    FactoryBot.create :user, access: 2
    FactoryBot.create :conference
    FactoryBot.create :booking
    visit '/users/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Account'
    click_link 'Request Certificate of attendance'
    expect(page).to have_content 'Successfully requested certificate!'
  end
  # specify 'I can change my password' do
  #     FactoryBot.create :user, access:2
  #     visit '/users/account'
  #     fill_in 'Username', with:'testinguser'
  #     fill_in 'Password', with:'password'
  #     click_button 'Log in'
  #     click_link 'Change Password'
  #     fill_in 'new-password', with: 'password'
  #     fill_in 'confirm-password', with: 'password'
  #     click_button 'submit-password'
  #     expect(page).to have_content 'User was successfully updated'
  # end
end
