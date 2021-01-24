ExtracurricularActivity.seed do |s|
  s.name = '野球部'
  s.beginning_year = '2009/04/01'
  s.ending_year = '2018/04/01'
  s.summary = '一度もレギュラーを取れませんでした'
  s.student = Student.find_by(family_name: '田中')
end

ExtracurricularActivity.seed do |s|
  s.name = '卓球部'
  s.beginning_year = '2012/04/01'
  s.summary = 'まだ成長途上です'
  s.student = Student.find_by(family_name: '田中')
end

ExtracurricularActivity.seed do |s|
  s.name = 'テニス部'
  s.beginning_year = '2011/04/01'
  s.ending_year = '2020/04/01'
  s.summary = 'サーブに自信あり'
  s.student = Student.find_by(family_name: '山田')
end

ExtracurricularActivity.seed do |s|
  s.name = 'バーレーボール部'
  s.beginning_year = '2015/04/01'
  s.summary = '一度もレギュラーを譲ったことはありません'
  s.student = Student.find_by(family_name: '山田')
end

ExtracurricularActivity.seed do |s|
  s.name = '写真部'
  s.beginning_year = '2015/04/01'
  s.ending_year = '2020/04/01'
  s.summary = '一眼レフに命をかけています'
  s.student = Student.find_by(family_name: '鈴木')
end

ExtracurricularActivity.seed do |s|
  s.name = '伝承遊びクラブ'
  s.beginning_year = '2019/04/01'
  s.summary = 'ベーゴマの鈴木と呼んでください'
  s.student = Student.find_by(family_name: '鈴木')
end
