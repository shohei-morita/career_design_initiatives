FactoryBot.define do
  factory :educational_background do
    location { 40 }
    division { 0 }
    school_name { '福岡県立築上中部高等学校' }
    entrance_date { '2018/04/01' }
    graduation_date { '2021/03/01' }
    note { '私の母校です。廃校になりました。' }

    association :student
  end
end
