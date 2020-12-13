FactoryBot.define do
  factory :student do
    sequence(:email) { |n| "#{n}test@test.email" }
    graduation_year { 0 }
    password { 'password' }
  end
end
