class Modification < ActiveRecord::Base
  has_many :modification_options
  has_many :items, through: :modification_options
  validates_presence_of :name
end
