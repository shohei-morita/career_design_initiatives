class ApealingVideo < SelfIntroduction
  has_one_attached :video, dependent: :destroy
  validates :video, presence: { message: I18n.t('errors.messages.file_unattached') },
                    blob: { content_type: %w[video/mp4], size_range: 1..250.megabytes }
end
