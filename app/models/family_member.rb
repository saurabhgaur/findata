class FamilyMember < ActiveRecord::Base
  belongs_to :user
  attr_accessible :email_id, :name
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }


end
