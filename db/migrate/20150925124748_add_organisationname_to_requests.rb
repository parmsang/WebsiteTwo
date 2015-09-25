class AddOrganisationnameToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :organisation_name, :string
  end
end
