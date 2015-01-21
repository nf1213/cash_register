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
  end

  factory :employee do
    name "Bob"
    status "Employee"
    password 333333
    salary 800
  end

  factory :sale do
    employee
  end

  factory :sale_item do
    name "Pizza"
    price 1000
    item
    sale
  end
end
