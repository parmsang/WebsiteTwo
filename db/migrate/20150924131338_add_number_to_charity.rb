class AddNumberToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :number, :string
  end
end
