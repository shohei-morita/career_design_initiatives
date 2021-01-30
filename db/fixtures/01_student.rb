Student.seed do |s|
  s.id = 1
  s.family_name = '田中'
  s.given_name = '隆'
  s.family_name_kana = 'タナカ'
  s.given_name_kana = 'タカシ'
  s.nickname = 'T＆T'
  s.tel = '090-9482-0862'
  s.suspended = false
  s.graduation_year = 1
  s.birth_date = '1990/08/01'
  s.password = 'password1'
  s.email = 'test001@mail.com'
  #s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
end

Student.seed do |s|
  s.id = 2
  s.family_name = '山田'
  s.given_name = '太郎'
  s.family_name_kana = 'ヤマダ'
  s.given_name_kana = 'タロウ'
  s.nickname = 'Y＆T'
  s.tel = '090-9482-0861'
  s.suspended = false
  s.graduation_year = 1
  s.birth_date = '1990/09/01'
  s.password = 'password2'
  s.email = 'test002@mail.com'
  #s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
end

Student.seed do |s|
  s.id = 3
  s.family_name = '鈴木'
  s.given_name = '一郎'
  s.family_name_kana = 'スズキ'
  s.given_name_kana = 'イチロウ'
  s.nickname = 'S＆I'
  s.tel = '090-9482-0860'
  s.suspended = false
  s.graduation_year = 1
  s.birth_date = '1990/10/01'
  s.password = 'password3'
  s.email = 'test003@mail.com'
  #s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
end
