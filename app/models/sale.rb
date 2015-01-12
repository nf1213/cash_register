class Sale < ActiveRecord::Base
  has_many :sale_items, dependent: :destroy
end
