class ApealingVideo < SelfIntroduction
  has_one_attached :video, dependent: :destroy

  validate :check_video

  def check_video
    return errors.add(:video, I18n.t('errors.messages.file_less')) unless video.attached?

    if video.blob.byte_size > 300.megabytes
      video.purge
      errors.add(:video, I18n.t('errors.messages.video_too_large'))
    elsif !video_type
      video.purge
      errors.add(:video, I18n.t('errors.messages.file_type_not_video'))
    end
  end

  def video_type
    %w[video/mp4].include?(video.blob.content_type)
  end
end
