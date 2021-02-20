11.times do |n|
  SelfIntroduction.seed do |s|
    s.type = "ApealingPoint"
    s.title = "チャーミングな前髪#{n}"
    s.content = "こだわりを持ち自分で切っています#{n}"
    s.student = Student.find_by(id: n + 1)
  end
end

11.times do |n|
  SelfIntroduction.seed do |s|
    s.type = "ApealingVideo"
    s.title = "チャーミングな頭頂部#{n}"
    s.content = "動画ではこんな感じです#{n}"
    s.student = Student.find_by(id: n + 1 )
  end
end

11.times do |n|
  SelfIntroduction.seed do |s|
    s.type = "ApealingImage"
    s.title = "チャーミングな側頭部#{n}"
    s.content = "画像ではこんな感じです#{n}"
    s.student = Student.find_by(id: n + 1)
  end
end
