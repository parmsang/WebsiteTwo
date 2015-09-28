class AddProjectdescriptionToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :project_description, :text
  end
end
