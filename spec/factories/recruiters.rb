FactoryBot.define do
  factory :recruiter do
    email { 'test01@test.email' }
    tel { '090-9999-0000' }
    fax { '090-9999-1111' }
    password { 'password' }
    password_confirmation { 'password' }
    family_name { 'さんぷる' }
    given_name { 'たろう' }
    family_name_kana { 'サンプル' }
    given_name_kana { 'タロウ' }
    department { '総務部' }
    title { '課長' }
    admin { false }
    approved { false }
    suspended { false }
  end

  trait :approved_recruiter do
    email { 'test02@test.email' }
    approved { true }
  end

  trait :admin do
    email { 'admin@test.email' }
    password { 'admin_password' }
    admin { true }
    approved { true }
  end
end
