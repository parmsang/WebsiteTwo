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
end
