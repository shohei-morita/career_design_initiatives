class ExtracurricularActivity < ApplicationRecord
  belongs_to :student

  validates :name, presence: true, length: { maximum: 50 }
  validates :beginning_year, presence: true
  validate :not_before_beginning_year
  validates :summary, length: { maximum: 500 }

  def not_before_beginning_year
    return if ending_year.nil?

    errors.add(:ending_year, 'は開始年よりも前に設定しないでください') unless beginning_year < ending_year || beginning_year == ending_year
  end
end
