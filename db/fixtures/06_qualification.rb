11.times do |n|
  Qualification.seed do |s|
    s.qualification_1st = "英検#{n}級"
    s.qualification_2nd = "仏検#{n}級"
    s.qualification_3rd = "独検#{n}級"
    s.note = "頑張りの成果#{n}"
    s.student = Student.find_by(id: n + 1)
  end
end
