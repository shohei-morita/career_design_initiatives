11.times do |n|
  Student.seed do |s|
    s.id = n + 1
    s.family_name = "test#{n + 1}"
    s.given_name = "example#{n + 1}"
    s.family_name_kana = 'テスト'
    s.given_name_kana = 'エグザンプル'
    s.nickname = "test&example#{n + 1}"
    s.tel = '090-9482-0862'
    s.suspended = false
    s.graduation_year = 1
    s.birth_date = '1990/08/01'
    s.password = 'password1'
    s.email = "test#{n + 1}@mail.com"
  end
end
