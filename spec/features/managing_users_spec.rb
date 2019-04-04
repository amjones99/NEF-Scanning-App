require 'rails_helper'


describe 'Managing users' do
  specify 'I can add new user' do
    FactoryBot.create :user
    visit '/users/new'
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    fill_in 'Username', with: 'user1'
    fill_in 'Password', with: 'password'
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
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    fill_in 'Access', with: 1
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'user'
    click_button 'Update User'
    fill_in 'Username', with:'user'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    expect(page).to have_content 'user'
    click_link 'Back'
    within(:css, 'table') {expect(page).to have_content 'user'}
  end

  specify 'I can see a list of users' do
    user1 = FactoryBot.create :user, name: 'User1', email: 'test@test.t'
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    within(:css, 'table') {expect(page).to have_content 'User1'}
  end

  specify 'I can delete users' do
    FactoryBot.create :user, name: 'test', email: 'test@test.t'
    FactoryBot.create :user
    visit '/users'
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Destroy'
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    within(:css, 'table') {expect(page).to_not have_content 'test'}
  end
end
