class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.integer :user_id
      t.string :name
      t.string :email_id
      t.timestamps
    end
  end
end
