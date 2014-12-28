FactoryGirl.define do
  factory :item do
    sequence(:name) {|n| "#{n}Pizza"}
    price 1000
  end

  factory :mod do
    sequence(:name) {|n| "#{n}Bacon"}
    price 100
  end

  factory :modification do
    item
    mod
  end

  factory :restaurant do
    name "Factory Girl's Food"
  end

  factory :employee do
    sequence(:name) {|n| "Nicole#{n}" }
    password 333333
    status 'Employee'
  end
end
