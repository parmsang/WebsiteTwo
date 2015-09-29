class RemoveNumberFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :number, :string
  end
end
