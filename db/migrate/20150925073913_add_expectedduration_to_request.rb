class AddExpecteddurationToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :expected_duration, :string
  end
end
