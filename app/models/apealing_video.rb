class ApealingVideo < SelfIntroduction
  has_one_attached :video, dependent: :destroy
  validates :video, presence: true,
                    blob: { content_type: %w[video/mp4], size_range: 1..250.megabytes }

  def thumbnail
    video.variant(resize: '150x150').processed
  end

  def show_size_for_student
    video.variant(resize: '500x500').processed
  end

  def show_size
    video.variant(resize: '500x500').processed
  end
end
