require 'rails_helper'

describe Request, type: :model do
  it { is_expected.to belong_to :charity }

  it 'is not valid unless it has a contact person' do
    request = Request.create(contact_person: '')
    expect(request).to have(1).error_on(:contact_person)
  end

  it 'is not valid unless it has a contact email' do
    request = Request.create(contact_email: '')
    expect(request).to have(1).error_on(:contact_email)
  end

  it 'is not valid unless it has a project description' do
    request = Request.create(project_description: '')
    expect(request).to have(1).error_on(:project_description)
  end

  it 'is not valid unless it has a thoughts' do
    request = Request.create(thoughts: '')
    expect(request).to have(1).error_on(:thoughts)
  end

  it 'is not valid unless it has a meeting frequency' do
    request = Request.create(meeting_frequency: '')
    expect(request).to have(1).error_on(:meeting_frequency)
  end

  it 'is not valid unless it has a expected duration' do
    request = Request.create(expected_duration: '')
    expect(request).to have(1).error_on(:expected_duration)
  end
end
