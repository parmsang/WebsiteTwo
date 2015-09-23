require 'rails_helper'
require 'rack/test'

feature 'showcase' do
  context 'no projects have been added' do
    scenario 'should display a prompt to add a project' do
      visit '/'
      expect(page).to have_content 'No projects in showcase!'
      expect(page).to have_link 'Add a project'
    end
  end

  context 'project have been added' do
    before do
      @project = Project.new(title: 'oxfam')
      @project.link = 'www.zombo.com'
      @project.description = 'blah-blah'
      @project.image = Rack::Test::UploadedFile.new('spec/fixtures/test_photo.png', 'image/png')
      @project.save
    end

    scenario 'display projects' do
      visit '/'
      expect(page).to have_content('oxfam')
      expect(page).not_to have_content('No projects in showcase!')
      expect(page).to have_link("view more", href: 'www.zombo.com')
      expect(page).to have_content('blah-blah')
      expect(page).to have_xpath "//img[contains(@src,'test_photo.png')]"
    end
  end

  context 'editing projects' do
    before do
      @project = Project.new(title: 'oxfam')
      @project.link = 'www.zombo.com'
      @project.description = 'blah-blah'
      @project.image = Rack::Test::UploadedFile.new('spec/fixtures/test_photo.png', 'image/png')
      @project.save
    end
    scenario 'have the option for edit' do
      visit '/'
      expect(page).to have_link("Edit oxfam")
    end

    scenario 'there is a form with the previous information' do
      visit '/'
      click_link 'Edit oxfam'
      expect(page).to have_field("Title", with: @project.title )
      expect(page).to have_field("Description", with: @project.description )
      expect(page).to have_field("Link", with: @project.link )
    end

    scenario 'can edit showcase' do
      visit '/'
      click_link 'Edit oxfam'
      fill_in 'Title', with: 'nspca'
      fill_in 'Description', with: 'help me!'
      fill_in 'Link', with: 'www.wwf.com'
      attach_file 'project_image', Rails.root.join('spec/fixtures/other_photo.png')
      click_button 'Edit project'
      expect(page).to have_content('nspca')
      expect(page).to have_link("view more", href: 'www.wwf.com')
      expect(page).to have_content('help me!')
      expect(page).to have_xpath "//img[contains(@src,'other_photo.png')]"
    end
  end
end
