require 'rails_helper'
require 'rack/test'

feature 'requests' do
  context 'no charities have been added' do
    scenario 'should display a prompt to add a charity' do
      visit '/requests'
      expect(page).to have_content 'No requests for help!'
      expect(page).to have_link 'Click here to request help for your charity'
    end
  end

  context 'charity have been added' do
    before do
      @charity = Charity.new(organisation_title: 'oxfam')
      @charity.email = 'sam@makers.com'
      @charity.project_description = 'blah-blah'
      @charity.password = '12345678'
      @charity.save
    end

    scenario 'display charities' do
      visit '/requests'
      expect(page).to have_content('oxfam')
      expect(page).not_to have_content('No charities in showcase!')
      expect(page).to have_content('blah-blah')
      expect(page).to have_content('sam@makers.com')
    end
  end

  context 'editing charities' do

    before do
      visit '/'
      click_link('Click here to request help for your charity')
      fill_in('Organisation title', with: 'oxfam')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      fill_in('Project description', with: 'I am a charity in need please help')
      click_button('Sign up')
    end
  #
    scenario 'have the option for edit when signed in as charity' do
      expect(page).to have_link("Edit oxfam")
    end

    scenario 'NOT have the option for edit when NOT signed in as charity' do
      click_link 'Sign out'
      visit '/requests'
      expect(page).not_to have_link("Edit oxfam")
    end

    scenario 'there is a form with the previous information' do
      click_link 'Edit oxfam'
      expect(page).to have_field('Organisation title', with: 'oxfam')
      expect(page).to have_field('Project description', with: 'I am a charity in need please help')
      expect(page).to have_field('Email', with: 'test@example.com')
    end

    scenario 'can edit showcase' do
      click_link 'Edit oxfam'
      fill_in 'Organisation title', with: 'nspca'
      fill_in 'Project description', with: 'help me!'
      fill_in 'Email', with: 'josh@makers.com'
      fill_in 'Current password', with: 'testtest'
      click_button 'Update'
      expect(page).to have_content('nspca')
      expect(page).to have_content('help me!')
      expect(page).to have_content('josh@makers.com')
    end
  end
  #
  context 'can close open projects' do

    before do
      visit '/'
      click_link('Click here to request help for your charity')
      fill_in('Organisation title', with: 'oxfam')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      fill_in('Project description', with: 'I am a charity in need please help')
      click_button('Sign up')
    end

    scenario 'have an option to close project' do
      visit '/requests'
      click_link 'Edit oxfam'
      expect(page).to have_button 'Close Project'
    end

    scenario 'can delete charity' do
      click_link 'Edit oxfam'
      expect{click_button 'Close Project'}.to change(Charity, :count).by(-1)
      expect(page).to have_content 'Your account has been successfully cancelled'
    end

  end

end
