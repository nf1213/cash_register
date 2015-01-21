class Employee < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password, :convert_salary
  after_save :clear_password

  belongs_to :restaurant
  has_many :shifts
  has_many :sales

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_confirmation_of :password, on: :create
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

  def encrypt_password
    if password.present?
      if self.salt.nil?
        self.salt = BCrypt::Engine.generate_salt
      end
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def self.authenticate(name="", login_password="")
    employee = Employee.find_by_name(name)
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

  def convert_salary
    self.salary = self.salary.to_f * 10
  end
end
