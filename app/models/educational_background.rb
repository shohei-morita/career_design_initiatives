class EducationalBackground < ApplicationRecord
  belongs_to :student

  validates :location, presence: true
  validates :division, presence: true
  validates :school_name, presence: true, length: { maximum: 50 }
  validates :entrance_date, presence: true
  validates :graduation_date, presence: true
  validates :note, length: { maximum: 500 }

  enum division: { 公立: 0, 私立: 1, その他: 2 }

  include JpPrefecture
  jp_prefecture :location

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_id).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
