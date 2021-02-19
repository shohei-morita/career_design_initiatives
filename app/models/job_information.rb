class JobInformation < ApplicationRecord
  belongs_to :company

  has_many :job_information_conditions, dependent: :destroy
  has_many :conditions, through: :job_information_conditions
  has_many :occupations, through: :job_information_conditions, source: :condition
  has_many :workstyles, through: :job_information_conditions, source: :condition
  has_many :workplaces, through: :job_information_conditions, source: :condition

  has_many :scout_job_infos, dependent: :destroy
  has_many :scouts, through: :scout_job_infos

  enum status: { 準備中: 0, 公開中: 1 }

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :appealing_point, presence: true, length: { maximum: 500 }
  validates :pay, presence: true, length: { maximum: 100 }
  validates :working_status, presence: true, length: { maximum: 100 }
  validates :working_hour, presence: true, length: { maximum: 100 }
  validates :benefit, presence: true, length: { maximum: 200 }
  validates :day_off, presence: true, length: { maximum: 150 }
  validates :selection, presence: true, length: { maximum: 500 }
  validates :workplace_detail, length: { maximum: 200 }
  validates :status, presence: true
end
