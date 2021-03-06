class SelfIntroduction < ApplicationRecord
  belongs_to :student

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }

  scope :apealing_point, -> { where(type: 'ApealingPoint') }
  scope :apealing_image, -> { where(type: 'ApealingImage') }
  scope :apealing_video, -> { where(type: 'ApealingVideo') }
end
