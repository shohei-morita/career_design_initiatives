class Scout < ApplicationRecord
  MAX_SCOUTS_COUNT = 50

  belongs_to :recruiter
  belongs_to :student

  has_many :scout_messages, dependent: :destroy
  accepts_nested_attributes_for :scout_messages

  has_many :scout_job_infos, dependent: :destroy
  has_many :job_information, through: :scout_job_infos

  validates :title, presence: true, length: { maximum: 50 }
  validate :scouts_count_must_be_within_limit
  validates :student_id, uniqueness: true

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end

  private
    def scouts_count_must_be_within_limit
      errors.add(:base, "スカウトが送信できる回数は#{MAX_SCOUTS_COUNT}までです") if recruiter.scouts.count >= MAX_SCOUTS_COUNT
    end
end
