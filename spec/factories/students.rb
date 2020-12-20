FactoryBot.define do
  factory :student do
    id { 0o1 }
    email { 'test01@test.email' }
    graduation_year { 0 }
    password { 'password' }
    password_confirmation { 'password' }
    family_name { 'さんぷる' }
    given_name { 'たろう' }
    family_name_kana { 'サンプル' }
    given_name_kana { 'タロウ' }
    nickname { 'サンプルの帝王' }
    birth_date { '2001/05/01' }
    tel { '090-9999-8888' }
    gender { 0 }
  end
end
