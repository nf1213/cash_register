class Mod < ActiveRecord::Base
  has_many :modifications
  has_many :items, through: :modifications
  validates_presence_of :name
end
