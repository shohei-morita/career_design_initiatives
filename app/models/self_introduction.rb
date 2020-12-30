class SelfIntroduction < ApplicationRecord
  belongs_to :student
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
