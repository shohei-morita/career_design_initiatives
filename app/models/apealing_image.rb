class ApealingImage < SelfIntroduction
  has_one_attached :image, dependent: :destroy
  validates :image, presence: true,
                    blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
end
