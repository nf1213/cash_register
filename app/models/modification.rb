class Modification < ActiveRecord::Base
  has_many :modification_options
  has_many :items, through: :modification_options
  belongs_to :restaurant
  validates :name,
    presence: true,
    uniqueness: { scope: :restaurant_id }

  validates_numericality_of :limit,
    greater_than: 0
end
