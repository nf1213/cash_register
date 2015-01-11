class SaleItemModification < ActiveRecord::Base
  belongs_to :sale_item

  validates_presence_of :sale_item_id
  validates_presence_of :modification_id
end
