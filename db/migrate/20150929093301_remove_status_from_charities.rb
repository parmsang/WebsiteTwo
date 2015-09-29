class RemoveStatusFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :status, :string
  end
end
