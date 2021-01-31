Address.seed do |s|
  s.postcode = '001-0010'
  s.prefecture_code = 1
  s.address_city = '札幌市'
  s.address_street ='札幌のどこか'
  s.address_building = '札幌ビル'
  s.student = Student.find_by(family_name: '田中')
end

Address.seed do |s|
  s.postcode = '036-0165'
  s.prefecture_code = 2
  s.address_city = '弘前市'
  s.address_street ='弘前のどこか'
  s.address_building = '弘前ビル'
  s.student = Student.find_by(family_name: '山田')
end

Address.seed do |s|
  s.postcode = '020-0001'
  s.prefecture_code = 3
  s.address_city = '盛岡市'
  s.address_street ='盛岡のどこか'
  s.address_building = '盛岡ビル'
  s.student = Student.find_by(family_name: '鈴木')
end
