FactoryBot.define do
  factory :address do
    postcode { 9300017 }
    prefecture_code { 16 }
    address_city { '富山市' }
    address_street { '東田地方町' }
    address_building { 'どこか' }
    association :student
  end
end
