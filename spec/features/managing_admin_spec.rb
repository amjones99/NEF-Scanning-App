require 'rails_helper'


describe 'Managing user as admin' do
  specify 'I can add new user' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Add User').click
    fill_in 'Username', with: 'user1'
    #fill_in 'Password', with: 'password'
    fill_in 'Access', with: 1
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'user1'
    click_button 'Create User'
    expect(page).to have_content 'User was successfully created'
    expect(page).to have_content 'user1'
    click_link 'Back'
    within(:css, 'table') {expect(page).to have_content 'user1'}
  end

  specify 'I can edit a user' do
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testignuser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#Options').find_link('Add User').click
    fill_in 'Username', with: 'usertest'
    fill_in 'Password', with: 'password'
    fill_in 'Access', with: 1
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'user'
    click_button 'Update User'
    expect(page).to have_content 'usertest'
  end

  specify 'I can see a list of users' do
    user1 = FactoryBot.create :user, name: 'testuser2', email: 'test@test.t'
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    within(:css, 'table') {expect(page).to have_content 'User1'}
  end

  specify 'I can delete users' do
    FactoryBot.create :user, name: 'test', email: 'test@test.t'
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Destroy'
    within(:css, 'table') {expect(page).to_not have_content 'test'}
  end

  specify 'I cant access user pages as an admin ' do
    user1 = FactoryBot.create :user, name: 'User1', email: 'test@test.t'
    visit '/users'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    visit '/users/badge'
    expect(page).to have_content 'All users'
  end
end
