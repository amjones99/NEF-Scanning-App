require 'rails_helper'

describe 'Managing users' do
  specify 'I can create a new notification' do
    visit '/notifications/new'
    fill_in 'Notification Name', with: 'notif 1'
    fill_in 'Notification Description', with: 'notif des'
    click_button 'Create Notification'
    expect(page).to have_content 'Notification was successfully created'
    expect(page).to have_content 'notif 1'
    click_link 'Back'
    within(:css, 'table') {expect(page).to have_content 'notif 1'}
  end
  specify 'I can edit a notification'do
    FactoryBot.create :notification
    visit '/notifications'
    click_link 'Edit'
    fill_in 'Notification Name', with: 'notif 1'
    fill_in 'Notification Description', with: 'notif des'
    click_button 'Update Notification'
    expect(page).to have_content 'Notification was successfully updated'
    expect(page).to have_content 'notif 1'
    click_link 'Back'
    within(:css, 'table') {expect(page).to have_content 'notif 1'}
  end
  specify 'I can see a list of notifications' do
    not1 = FactoryBot.create :notification, not_id:'not1'
    not2 = FactoryBot.create :notification, not_id:'not2'
    visit '/notifications'
    within(:css, 'table') {expect(page).to have_content 'not1'}
    within(:css, 'table') {expect(page).to have_content 'not2'}
  end
  specify 'I can destroy notifications' do
    FactoryBot.create :notification
    visit '/notifications'
    click_link 'Destroy'
    within(:css, 'table') {expect(page).to_not have_content 'notif1'}
  end

end
