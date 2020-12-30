FactoryBot.define do
  factory :address do
    postcode { 9300017 }
    prefecture_code { 1 }
    address_city { '富山県' }
    address_street { '富山市' }
    address_building { 'どこか' }
    association :student, factory: :student
  end
end
