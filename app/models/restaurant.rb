class Restaurant < ActiveRecord::Base
  has_many :employees
  accepts_nested_attributes_for :employees
  validates_presence_of :name
end
