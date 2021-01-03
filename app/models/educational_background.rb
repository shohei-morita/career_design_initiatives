class EducationalBackground < ApplicationRecord
  belongs_to :student

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
