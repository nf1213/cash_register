class Item < ActiveRecord::Base
  has_many :modification_options
  has_many :modifications, through: :modification_options

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :price
  validates :price,
    numericality: { greater_than: 0, message: "must be greater than $0.00" }
end
