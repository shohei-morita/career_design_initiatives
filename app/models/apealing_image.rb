class ApealingImage < SelfIntroduction
  has_one_attached :image, dependent: :destroy
  validates :image, presence: true,
                    blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }

  def thumbnail
    image.variant(resize: '150x150').processed
  end

  def profile_image_size_for_student
    image.variant(resize: '300x300').processed
  end

  def profile_image_size
    image.variant(resize: '500x500').processed
  end
end
