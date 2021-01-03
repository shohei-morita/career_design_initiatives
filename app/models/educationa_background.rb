class EducationaBackground < ApplicationRecord
  belongs_to :student
  
  include JpPrefecture
  jp_prefecture :prefecture_code
end
