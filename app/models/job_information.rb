class JobInformation < ApplicationRecord
  belongs_to :company
  enum status: { 準備中: 0, 公開中: 1 }

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :appealing_point, presence: true, length: { maximum: 500 }
  validates :pay, presence: true, lenght: { maximum: 100 }
  validates :working_status, presence: true, length: { maximum: 100 }
  validates :working_hour, presence: true, length: { maximum: 100 }
  validates :benefit, presence: true, length: { maximum: 200 }
  validates :day_off, presence: true, length: { maximum: 150 }
  validates :selectionm, presence: true, length: { maximum: 500 }

end
