FactoryBot.define do
  factory :scout do
    title { 'ブラック企業からのスカウトです' }
    association :student
    association :recruiter
  end
end
