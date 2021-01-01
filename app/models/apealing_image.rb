class ApealingImage < SelfIntroduction
  has_one_attached :image, dependent: :destroy
  validate :check_image

  def check_image
    return errors.add(:image, I18n.t('errors.messages.file_less')) unless image.attached?

    if image.blob.byte_size > 10.megabytes
      image.purge
      errors.add(:image, I18n.t('errors.messages.file_too_large'))
    elsif !image_type
      image.purge
      errors.add(:image, I18n.t('errors.messages.file_type_not_image'))
    end
  end

  def image_type
    %w[image/jpg image/jpeg image/gif image/png].include?(image.blob.content_type)
  end
end
