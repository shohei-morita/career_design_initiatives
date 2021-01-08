FactoryBot.define do
  factory :extracurricular_activity do
    sequence(:name, 'name_1')

    sequence(:beginning_year, 2015) do |n|
      "#{n}/01/01"
    end

    sequence(:ending_year, 2016) do |n|
      "#{n}/01/01"
    end

    sequence(:summary, '特にありません_1')

    association :student
  end
end
