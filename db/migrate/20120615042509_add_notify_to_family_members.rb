class AddNotifyToFamilyMembers < ActiveRecord::Migration
  def change
    add_column :family_members, :notify, :boolean, :default => :false
  end

  def down
    remove_column :family_members, :notify
  end
end
