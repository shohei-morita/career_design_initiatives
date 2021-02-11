11.times do |n|
  Award.seed do |s|
    s.title = "絵画コンクール入賞#{n}"
    s.year = '2010/04/01'
    s.summary = "適当に描いた作品です"
    s.student = Student.find_by(id: n + 1)
  end
end
