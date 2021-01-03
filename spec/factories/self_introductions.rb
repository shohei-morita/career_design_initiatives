FactoryBot.define do
  factory :self_introduction do
    association :student
  end

  factory :apealing_point, parent: :self_introduction, class: 'ApealingPoint' do
    title { 'アピールポイント' }
    content { '特にありません' }
  end

  factory :apealing_image, parent: :self_introduction, class: 'ApealingImage' do
    title { 'アピール画像' }
    content { '特にありません2' }

    after(:build) do |item|
      item.image.attach(io: File.open("#{Rails.root}/tmp/test_image.png"),
                        filename: 'test_image.png', content_type: 'image/png')
    end
  end

  factory :apealing_video, parent: :self_introduction, class: 'ApealingVideo' do
    title { 'アピール動画' }
    content { '特にありません3' }

    after(:build) do |item|
      item.video.attach(io: File.open("#{Rails.root}/tmp/test_video.mp4"),
                        filename: 'test_video.mp4', content_type: 'video/mp4')
    end
  end
end
