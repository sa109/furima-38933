FactoryBot.define do
  factory :purchase_shipping_adres do
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    region_id { Faker::Number.between(from: 1, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
