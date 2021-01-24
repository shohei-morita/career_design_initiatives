EducationalBackground.seed do |s|
  s.location = 1
  s.division = 0
  s.school_name = '札幌高校'
  s.entrance_date ='2018/04/01'
  s.graduation_date = '2021/03/01'
  s.note = '偏差値50'
  s.student = Student.find_by(family_name: '田中')
end

EducationalBackground.seed do |s|
  s.location = 2
  s.division = 1
  s.school_name = '弘前高校'
  s.entrance_date ='2018/04/01'
  s.graduation_date = '2021/03/01'
  s.note = '偏差値60'
  s.student = Student.find_by(family_name: '山田')
end

EducationalBackground.seed do |s|
  s.location = 3
  s.division = 2
  s.school_name = '盛岡高校'
  s.entrance_date ='2018/04/01'
  s.graduation_date = '2021/03/01'
  s.note = '偏差値40'
  s.student = Student.find_by(family_name: '鈴木')
end
