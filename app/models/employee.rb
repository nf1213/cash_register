class Employee < ActiveRecord::Base
  belongs_to :restaurant
  has_many :shifts
  has_many :sales

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :password
  validates_presence_of :status
  validates :salary,
    presence: true,
    numericality: { greater_than: 0, message: "must be greater than $0.00" }

  def self.names
    names = []
    Employee.all.each do |e|
      names << e.name
    end
    names
  end
end
