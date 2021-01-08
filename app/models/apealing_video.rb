class ApealingVideo < SelfIntroduction
  has_one_attached :video, dependent: :destroy
  validates :video, presence: true,
                    blob: { content_type: %w[video/mp4], size_range: 1..250.megabytes }
end
