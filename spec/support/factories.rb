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
    sequence(:name) { |n| "Bob#{n}"}
    status "Employee"
    password 333333
    salary 800
    restaurant

    factory :manager do
      status "Manager"
    end
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
