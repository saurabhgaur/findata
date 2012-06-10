class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :first_line
      t.text :second_line
      t.text :city
      t.text :state
      t.text :zip
      t.text :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
    add_index :addresses, [:addressable_id,:addressable_type]
  end
end
