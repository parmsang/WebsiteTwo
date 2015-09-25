class Request < ActiveRecord::Base

  belongs_to :charity

  validates_presence_of :contact_person, :contact_email, :project_description, :thoughts, :meeting_frequency, :expected_duration

end
