class Item < ActiveRecord::Base
  has_many :modification_options
  has_many :modifications, through: :modification_options
  has_many :sale_items
  belongs_to :restaurant

  validates :name,
    presence: true,
    uniqueness: { scope: :restaurant_id }

  validates_presence_of :price
  validates :price,
    numericality: { greater_than: 0, message: "must be greater than $0.00" }
end
