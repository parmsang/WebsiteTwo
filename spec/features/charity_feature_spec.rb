require 'rails_helper'

feature "charity can sign in and out" do
  context "Charity not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end
# Are you a charity or non-profit organisation?
  context "Charity signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Organisation title', with: 'RSPCA')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      fill_in('Are you a charity or non-profit organisation?', with: 'charity')
      fill_in('Charity Number or NonProfit Company Number', with: '007')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
