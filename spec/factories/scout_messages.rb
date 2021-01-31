FactoryBot.define do
  factory :scout_message do
    content { '一緒に働きませんか' }
    read_unread { false }
    association :scout
  end
end
