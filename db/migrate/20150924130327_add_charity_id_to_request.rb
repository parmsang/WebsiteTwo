class AddCharityIdToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :charity, index: true, foreign_key: true
  end
end
