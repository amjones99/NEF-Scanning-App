require 'rails_helper'

describe 'Managing  conferences as an admin ' do
  specify 'I can add a new conference ' do
    FactoryBot.create :user
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Conferences').click
    click_link 'New Conference'
    fill_in 'Number of Days', with: '2'
    fill_in 'Conference name', with: 'test'
    fill_in 'Conference location', with: 'sheffield hallam'
    click_button 'Create Conference'
    expect(page).to have_content 'Conference was successfully created'
  end
  specify 'I can edit conference ' do
    FactoryBot.create :user
    FactoryBot.create :conference
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Conferences').click
    click_link 'Edit'
    fill_in 'location', with: 'sheffield goodwin'
    click_button 'Update Conference'
    expect(page).to have_content 'Conference was successfully updated'
  end
  specify 'I can destroy conference ' do
    FactoryBot.create :user
    FactoryBot.create :conference
    visit '/'
    fill_in 'Username', with:'testinguser'
    fill_in 'Password', with:'password'
    click_button 'Log in'
    page.find('#wrap').find_link('Conferences').click
    click_link 'Destroy'
    within(:css, 'table') {expect(page).to_not have_content 'Conferencetest'}
  end


end
