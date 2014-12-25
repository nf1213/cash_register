class Transaction < ActiveRecord::Base
  has_many :transaction_items
end
