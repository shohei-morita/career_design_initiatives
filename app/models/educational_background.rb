class EducationalBackground < ApplicationRecord
  belongs_to :student

  validates :location, presence: { message: 'を選択してください' }
  validates :division, presence: { message: 'を選択してください' }
  validates :school_name, presence: true, length: { maximum: 50 }
  validates :entrance_date, presence: { message: 'を選択してください' }
  validates :graduation_date, presence: { message: 'を選択してください' }
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
