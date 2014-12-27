FactoryGirl.define do
  factory :item do
    sequence(:name) {|n| "#{n}Pizza"}
    price 1000
  end

  factory :mod do
    sequence(:name) {|n| "#{n}Cheese"}
  end

  factory :modification do
    item
    mod
  end

  factory :restaurant do
    name "Factory Girl's Food"
  end
end
