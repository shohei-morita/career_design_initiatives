Award.seed do |s|
  s.title = '絵画コンクール優勝'
  s.year = '2010/04/01'
  s.summary = '楽勝でした'
  s.student = Student.find_by(family_name: '田中')
end

Award.seed do |s|
  s.title = '美声コンクール優勝'
  s.year = '2011/04/01'
  s.summary = '辛勝でした'
  s.student = Student.find_by(family_name: '田中')
end

Award.seed do |s|
  s.title = '空手大会優勝'
  s.year = '2019/04/01'
  s.summary = '肋骨をおりました'
  s.student = Student.find_by(family_name: '山田')
end

Award.seed do |s|
  s.title = '少林寺拳法大会優勝'
  s.year = '2020/04/01'
  s.summary = '右腕をおりました'
  s.student = Student.find_by(family_name: '山田')
end

Award.seed do |s|
  s.title = '占星術コンテスト'
  s.year = '2012/04/01'
  s.summary = '自分の今年の運勢は最悪でした'
  s.student = Student.find_by(family_name: '鈴木')
end

Award.seed do |s|
  s.title = '姓名判断コンテスト'
  s.year = '2014/04/01'
  s.summary = '自分の名前はいまいちなんですが'
  s.student = Student.find_by(family_name: '鈴木')
end
