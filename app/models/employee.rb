class Employee < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :password
  validates_presence_of :status

  def self.names
    names = []
    Employee.all.each do |e|
      names << e.name
    end

    names
  end
end
