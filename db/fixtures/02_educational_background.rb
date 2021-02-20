11.times do |n|
  EducationalBackground.seed do |s|
    s.location = n + 1
    s.division = 1
    s.school_name = "弘前高校#{n + 1}"
    s.entrance_date ='2018/04/01'
    s.graduation_date = '2021/03/01'
    s.note = "偏差値#{50 + n}"
    s.student = Student.find_by(id: n + 1)
  end
end
