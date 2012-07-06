class FamilyMember < ActiveRecord::Base
  belongs_to :user
  attr_accessible :email_id, :name, :notify
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :email_id, presence: true, length: { maximum: 140 }
  validates :email_id, :email_format => true

  has_many :addresses, as: :addressable, dependent: :destroy


end
