class TransactionItem < ActiveRecord::Base
  belongs_to :transaction
  has_many :transaction_item_modifications

  validates_presence_of :transaction_id
  validates_presence_of :item_id
end
