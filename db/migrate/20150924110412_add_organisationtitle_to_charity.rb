class AddOrganisationtitleToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :organisation_title, :string
  end
end
