class TransactionItemModification < ActiveRecord::Base
  belongs_to :transaction_item

  validates_presence_of :transaction_item_id
  validates_presence_of :modification_id
end
