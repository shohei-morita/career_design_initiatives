SelfIntroduction.seed do |s|
  s.type = "ApealingPoint"
  s.title = 'チャーミングな前髪'
  s.content = 'こだわりを持ち自分で切っています'
  s.student = Student.find_by(family_name: '田中')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingVideo"
  s.title = 'チャーミングな前髪'
  s.content = '動画ではこんな感じです'
  s.student = Student.find_by(family_name: '田中')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingImage"
  s.title = 'チャーミングな前髪'
  s.content = '写真ではこんな感じです'
  s.student = Student.find_by(family_name: '田中')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingPoint"
  s.title = 'チャーミングなもみあげ'
  s.content = 'こだわりを持ち自分で切っています'
  s.student = Student.find_by(family_name: '山田')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingVideo"
  s.title = 'チャーミングなもみあげ'
  s.content = '動画ではこんな感じです'
  s.student = Student.find_by(family_name: '山田')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingImage"
  s.title = 'チャーミングなもみあげ'
  s.content = '写真ではこんな感じです'
  s.student = Student.find_by(family_name: '山田')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingPoint"
  s.title = 'チャーミングな頭頂部'
  s.content = 'こだわりを持ち自分で切っています'
  s.student = Student.find_by(family_name: '鈴木')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingVideo"
  s.title = 'チャーミングな頭頂部'
  s.content = '動画ではこんな感じです'
  s.student = Student.find_by(family_name: '鈴木')
end

SelfIntroduction.seed do |s|
  s.type = "ApealingImage"
  s.title = 'チャーミングな頭頂部'
  s.content = '写真ではこんな感じです'
  s.student = Student.find_by(family_name: '鈴木')
end
