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

  # context 'charity have been added' do
  #   before do
  #     @charity = Charity.new(title: 'oxfam')
  #     @charity.link = 'www.zombo.com'
  #     @charity.description = 'blah-blah'
  #     @charity.image = Rack::Test::UploadedFile.new('spec/fixtures/test_photo.png', 'image/png')
  #     @charity.save
  #   end
  #
  #   scenario 'display charities' do
  #     visit '/'
  #     expect(page).to have_content('oxfam')
  #     expect(page).not_to have_content('No charities in showcase!')
  #     expect(page).to have_link("view more", href: 'www.zombo.com')
  #     expect(page).to have_content('blah-blah')
  #     expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
  #   end
  # end
  #
  # context 'creating charities' do
  #   scenario 'prompts user to fill out a form, then displays the new charity' do
  #     visit '/'
  #     click_link 'Add a charity'
  #     fill_in 'Title', with: 'Red Cross'
  #     fill_in 'Description', with: 'Helps people'
  #     fill_in 'Link', with: 'www.zombo.com'
  #     page.attach_file('charity[image]', Rails.root + 'spec/fixtures/test_photo.png')
  #     click_button 'Create charity'
  #     expect(page).to have_content 'Red Cross'
  #     expect(page).to have_content 'Helps people'
  #     expect(page).to have_xpath("//img[contains(@src,'test_photo.png')]")
  #     expect(page).to have_link("view more", href: 'www.zombo.com')
  #     expect(current_path).to eq '/'
  #   end
  #   context 'it displays error when title/description/link is not valid' do
  #     scenario 'title and description must be present' do
  #       visit '/'
  #       click_link 'Add a charity'
  #       click_button 'Create charity'
  #       expect(page).to have_content 'Title can\'t be blank'
  #       expect(page).to have_content 'Description can\'t be blank'
  #     end
  #   end
  # end
  #
  # context 'editing charities' do
  #
  #   before do
  #     @charity = charity.new(title: 'oxfam')
  #     @charity.link = 'www.zombo.com'
  #     @charity.description = 'blah-blah'
  #     @charity.image = Rack::Test::UploadedFile.new('spec/fixtures/test_photo.png', 'image/png')
  #     @charity.save
  #   end
  #
  #   scenario 'have the option for edit' do
  #     visit '/'
  #     expect(page).to have_link("Edit oxfam")
  #   end
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
  # end
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
