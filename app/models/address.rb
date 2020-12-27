class Address < ApplicationRecord
  belongs_to :student

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_id).try(name)
  end

  def prefecture_name=(*)
    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
