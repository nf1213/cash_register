class TransactionItem < ActiveRecord::Base
  belongs_to :transaction
  has_many :transactional_modifications

  validates_presence_of :transaction_id
  validates_presence_of :item_id
end
