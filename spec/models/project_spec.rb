require 'rails_helper'

describe Project, type: :model do

  it 'is not valid unless it has a title' do
    project = Project.create(title: '', description: 'blah-blah' )
    expect(project).to have(1).error_on(:title)
  end

  it 'is not valid unless it has a description' do
    project = Project.create(title: 'Red Cross', description: '')
    expect(project).to have(1).error_on(:description)
  end
end
