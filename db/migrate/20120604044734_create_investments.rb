class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :user_id
      t.string :institution_name
      t.string :first_owner_name
      t.string :second_owner_name
      t.string :account_number
      t.string :notes
      t.string :nominee
      t.timestamps
    end
  end
end
