class Employee < ActiveRecord::Base
  include User
  attr_accessor :password

  before_save :encrypt_password

  belongs_to :restaurant
  has_many :shifts
  has_many :sales

  validates :name,
    presence: true,
    uniqueness: { scope: :restaurant_id }

  validates_confirmation_of :password, on: :create
  validates_presence_of :password, on: :create
  validates_presence_of :status
  validates :salary,
    presence: true,
    numericality: { greater_than: 0, message: "must be greater than $0.00" }

  def self.authenticate(name="", login_password="", restaurant)
    employee = Employee.find_by_name_and_restaurant_id(name, restaurant.id)
    if employee && employee.match_password(login_password)
      return employee
    else
      return false
    end
  end
end
