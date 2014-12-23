class Attribute < ActiveRecord::Base
  has_many :attributions
  has_many :items, through: :attributions
  validates_presence_of :name
end
