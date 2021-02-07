FactoryBot.define do
  factory :qualification do
    qualification_1st { '英検準２級' }
    qualification_2nd { 'TOEIC 850点' }
    qualification_3rd { '世界遺産検定３級' }
    qualification_4th { '日商簿記検定３級' }
    qualification_5th { 'ビジネス実務法務検定３級' }
    note { '学校の勉強の傍にがんばりました' }

    association :student
  end
end
