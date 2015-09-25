class AddMeetingfrequencyToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :meeting_frequency, :string
  end
end
