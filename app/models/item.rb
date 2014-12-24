class Item < ActiveRecord::Base
  has_many :modifications
  has_many :mods, through: :modifications

  validates_presence_of :name
  validates_presence_of :price
end
