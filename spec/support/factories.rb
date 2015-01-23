FactoryGirl.define do
  factory :item do
    sequence(:name) {|n| "#{n}Pizza"}
    price 1000
  end

  factory :modification do
    sequence(:name) {|n| "#{n}Bacon"}
    price 100
  end

  factory :modification_option do
    item
    modification
  end

  factory :restaurant do
    name "Factory Girl's Food"
    password 333333
  end

  factory :employee do
    name "Bob"
    status "Employee"
    password 333333
    salary 800
    restaurant
  end

  factory :sale do
    employee
  end

  factory :sale_item do
    sequence(:name) {|n| "#{n}Pizza"}
    price 1000
    item
    sale
  end
end

def password
  333333
end

def factory_for_employee(restaurant)
  Employee.create(name: "Bob", password: password, status: "Employee", salary: 800, restaurant: restaurant)
end

def factory_for_employee2(restaurant)
  Employee.create(name: "Fred", password: password, status: "Employee", salary: 800, restaurant: restaurant)
end

def factory_for_manager(restaurant)
  Employee.create(name: "Nicole", password: password, status: "Manager", salary: 800, restaurant: restaurant)
end

def factory_for_restaurant
  Restaurant.create(name: "Factory Girl's Food", password: password)
end
