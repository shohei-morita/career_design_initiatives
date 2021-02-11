11.times do |n|
  Address.seed do |s|
    s.postcode = '001-0010'
    s.prefecture_code = n + 1
    s.address_city = '札幌市'
    s.address_street ='札幌のどこか'
    s.address_building = '札幌ビル'
    s.student = Student.find_by(id: n + 1)
  end
end
