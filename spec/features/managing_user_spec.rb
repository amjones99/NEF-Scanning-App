require 'rails_helper'


describe 'Managing user' do
  specify 'I can edit my account' do
    FactoryBot.create :user
    visit '/users/account'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Username', with: 'user'
    #fill_in 'Password', with: 'password'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'tesingupdate'
    click_button 'Update User'
    visit '/users/account'
    expect(page).to have_content 'testingUpdate'
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
end
