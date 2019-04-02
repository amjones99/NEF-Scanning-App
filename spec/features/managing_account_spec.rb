require 'rails_helper'


describe 'Managing users' do
  specify 'I can edit my account' do
    FactoryBot.create :user
    visit '/users/account'
    fill_in 'Username', with:'usert'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    fill_in 'Access', with: '1'
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
end
