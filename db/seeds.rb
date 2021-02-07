require 'csv'

CSV.foreach('db/csv/conditions.csv', headers: true) do |row|
  Condition.create(type: row['type'], name: row['name']
  )
end

#Recruiter.create(family_name: '田中', given_name: '太郎', family_name_kana: 'タナカ', given_name_kana: 'タロウ',
#                email: 'admin@gmail.com', password: '111111', department: '所属なし', tel: '090', admin: true, approved: true)

s1 = Student.find_by(family_name: '田中')
s2 = Student.find_by(family_name: '山田')
s3 = Student.find_by(family_name: '鈴木')

s1.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
s2.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
s3.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')

s1.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
s2.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')
s3.apealing_image.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/png')

s1.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
s2.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
s3.apealing_video.video.attach(io: File.open(Rails.root.join('app', 'assets', 'videos', 'test_video.mp4')), filename: 'test_video.mp4', content_type: 'video/mp4')
