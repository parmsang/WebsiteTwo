class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :contact_person
      t.string :contact_email
      t.integer :contact_phone
      t.string :project_description
      t.string :thoughts

      t.timestamps null: false
    end
  end
end
