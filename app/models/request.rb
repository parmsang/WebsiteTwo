class Request < ActiveRecord::Base

  belongs_to :charity

  validates_presence_of :contact_person, :organisation_name, :contact_email, :project_description, :meeting_frequency

end
