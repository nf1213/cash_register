class Restaurant < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  has_many :employees
  has_many :items
  has_many :modifications
  has_many :sales
  has_many :sale_items
  has_many :sale_item_modifications
  has_many :shifts

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_confirmation_of :password, on: :create
  validates_presence_of :password, on: :create

  def encrypt_password
    if password.present?
      if self.salt.nil?
        self.salt = BCrypt::Engine.generate_salt
      end
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def self.authenticate(name="", login_password="")
    restaurant = Restaurant.find_by_name(name)
    if restaurant && restaurant.match_password(login_password)
      return restaurant
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
