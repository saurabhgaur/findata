class Investment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :account_number, :first_owner_name, :institution_name, :nominee, :notes, :second_owner_name
  validates :institution_name, presence: true, length: { maximum: 140 }
  validates :account_number, presence: true, length: { maximum: 140 }

end
