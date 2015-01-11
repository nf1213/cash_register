class SaleItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :sale
  has_many :sale_item_modifications

  validates_presence_of :sale_id
  validates_presence_of :item_id
end