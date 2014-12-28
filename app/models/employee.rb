class Employee < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :status
end