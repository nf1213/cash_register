class Sale < ActiveRecord::Base
  has_many :sale_items, dependent: :destroy
  belongs_to :employee
  belongs_to :restaurant
end
