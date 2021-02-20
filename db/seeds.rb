require 'csv'

#CSV.foreach('db/csv/conditions.csv', headers: true) do |row|
#  Condition.create(type: row['type'], name: row['name']
#  )
#end

Recruiter.create(family_name: '田中', given_name: '太郎', family_name_kana: 'タナカ', given_name_kana: 'タロウ',
                email: 'admin@gmail.com', password: '111111', department: '所属なし', tel: '090-9494-0909', admin: true, approved: true)

11.times do |n|
  s = Student.find_by(id: n + 1)

  s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
  s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
  s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')

  s.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
  s.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
  s.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')

  s.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
  s.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
  s.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
end
