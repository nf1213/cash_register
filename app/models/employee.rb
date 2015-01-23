class Employee < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

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

  def encrypt_password
    if password.present?
      if self.salt.nil?
        self.salt = BCrypt::Engine.generate_salt
      end
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def self.authenticate(name="", login_password="", restaurant)
    employee = Employee.find_by_name_and_restaurant_id(name, restaurant.id)
    if employee && employee.match_password(login_password)
      return employee
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def clear_password
    self.password = nil
  end
end
