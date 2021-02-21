1.times do |n|
  Recruiter.seed do |s|
    s.family_name = '田中'
    s.given_name = '太郎'
    s.family_name_kana = "タナカ"
    s.given_name_kana = 'タロウ'
    s.email = 'admin@mail.com'
    s.password = 'password'
    s.department = '所属なし'
    s.tel = '00011112222'
    s.admin = true
    s.approved = true
  end
end
