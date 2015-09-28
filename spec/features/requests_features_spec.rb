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
  #
  #   scenario 'there is a form with the previous information' do
  #     visit '/'
  #     click_link 'Edit oxfam'
  #     expect(page).to have_field("Title", with: @charity.title )
  #     expect(page).to have_field("Description", with: @charity.description )
  #     expect(page).to have_field("Link", with: @charity.link )
  #   end
  #
  #   scenario 'can edit showcase' do
  #     visit '/'
  #     click_link 'Edit oxfam'
  #     fill_in 'Title', with: 'nspca'
  #     fill_in 'Description', with: 'help me!'
  #     fill_in 'Link', with: 'www.wwf.com'
  #     attach_file 'charity_image', Rails.root.join('spec/fixtures/other_photo.png')
  #     click_button 'Edit charity'
  #     expect(page).to have_content('nspca')
  #     expect(page).to have_link("view more", href: 'www.wwf.com')
  #     expect(page).to have_content('help me!')
  #     expect(page).to have_xpath "//img[contains(@src,'other_photo.png')]"
  #   end
  end
  #
  # context 'can delete charities from showcase' do
  #
  #   before do
  #     @charity = charity.new(title: 'oxfam')
  #     @charity.link = 'www.zombo.com'
  #     @charity.description = 'blah-blah'
  #     @charity.image = Rack::Test::UploadedFile.new('spec/fixtures/test_photo.png', 'image/png')
  #     @charity.save
  #   end
  #
  #   scenario 'have an option to delete' do
  #     visit '/'
  #     click_link 'Edit oxfam'
  #     expect(page).to have_link 'Delete oxfam'
  #   end
  #
  #   scenario 'can delete charity' do
  #     visit '/'
  #     click_link 'Edit oxfam'
  #     expect{click_link 'Delete oxfam'}.to change(charity, :count).by(-1)
  #     expect(page).to have_content 'charity successfully deleted'
  #     expect(page).to have_content 'No charities in showcase!'
  #   end

  # end

end
