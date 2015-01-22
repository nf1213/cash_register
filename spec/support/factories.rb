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

    after(:create) do |r|
      salt = BCrypt::Engine.generate_salt
      r.encrypted_password = BCrypt::Engine.hash_secret(r.password, salt)
    end
  end

  factory :employee do
    name "Bob"
    status "Employee"
    password 333333
    salary 800
    restaurant

    after(:create) do |e|
      salt = BCrypt::Engine.generate_salt
      e.encrypted_password = BCrypt::Engine.hash_secret(e.password, salt)
    end
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
