class Item < ActiveRecord::Base
  has_many :attributions
  has_many :attributes, through: :attributions

  validates_presence_of :name
  validates_presence_of :price
end
