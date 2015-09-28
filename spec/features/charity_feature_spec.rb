require 'rails_helper'

feature "charity can sign in and out" do
  context "Charity not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Click here to request help for your charity')
    end

    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "Charity signed in on the homepage" do
    before do
      visit('/')
      click_link('Click here to request help for your charity')
      fill_in('Organisation title', with: 'RSPCA')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      fill_in('Project description', with: 'I am a charity in need please help')
      click_button('Sign up')
    end

    scenario "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    scenario 'should take us to the open projects showcase' do
      expect(current_path).to eq '/requests'
    end

  end
end
