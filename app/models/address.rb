class Address < ActiveRecord::Base
  attr_accessible :city, :country, :first_line, :second_line, :state, :zip
  belongs_to :addressable, polymorphic: true
  validates :first_line, presence: true, length: { maximum: 140 }
  validates :second_line, presence: true, length: { maximum: 140 }
  validates :country, presence: true, length: { maximum: 140 }
  validates :state, presence: true, length: { maximum: 140 }
  validates :city, presence: true, length: { maximum: 140 }
  validates :zip, presence: true, length: { maximum: 140 }
end
