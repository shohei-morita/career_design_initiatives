11.times do |n|
  ExtracurricularActivity.seed do |s|
    s.name = "野球部#{n}"
    s.beginning_year = '2010/04/01'
    s.summary = "あまりできませんでした"
    s.student = Student.find_by(id: n + 1)
  end
end
