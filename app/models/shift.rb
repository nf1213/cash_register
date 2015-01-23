class Shift < ActiveRecord::Base
  belongs_to :employee
  validates_presence_of :employee
  belongs_to :restaurant
end
