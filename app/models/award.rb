class Award < ApplicationRecord
  belongs_to :student

  validates :title, presence: true, length: { maximum: 50 }
  validates :year, presence: true
  validates :summary, length: { maximum: 500 }
end
