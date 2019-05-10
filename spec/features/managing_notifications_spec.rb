require 'rails_helper'


describe 'Managing notifications' do
  specify 'I can add new notification' do
    FactoryBot.create :user
    visit '/notifications'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'New Notification'
    fill_in 'Notification Name', with: 'notification name'
    fill_in 'Notification Description', with: 'notification description'
    click_button 'Create Notification'
    expect(page).to have_content 'Notification was successfully created'
  end

  specify 'I can edit a notification' do
    FactoryBot.create :notification
    FactoryBot.create :user
    visit '/notifications'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Notification Name', with: 'notification name'
    fill_in 'Notification Description', with: 'notification description'
    click_button 'Update Notification'
    expect(page).to have_content 'Notification was successfully updated'

  end

  specify 'I can see a list of notifications' do
    FactoryBot.create :user
    user1 = FactoryBot.create :notification, not_id: 'not 1'
    user2 = FactoryBot.create :notification, not_id: 'not 2'
    visit '/notifications'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    within(:css, 'table') {expect(page).to have_content 'not 1'}
    within(:css, 'table') {expect(page).to have_content 'not 2'}

  end

  specify 'I can delete notifications' do
    FactoryBot.create :notification
    FactoryBot.create :user
    visit '/notifications'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    click_link 'Destroy'
    within(:css, 'table') {expect(page).to_not have_content 'notification'}

  end
end
