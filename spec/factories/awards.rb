FactoryBot.define do
  factory :award do
    sequence(:title, 'title_1')

    sequence(:year, 2015) do |n|
      "#{n}/01/01"
    end

    sequence(:summary, 'summary_1')

    association :student
  end
end
