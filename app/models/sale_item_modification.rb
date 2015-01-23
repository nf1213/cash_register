class SaleItemModification < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :modification
  belongs_to :restaurant

  validates_presence_of :sale_item_id
  validates_presence_of :modification_id
end
