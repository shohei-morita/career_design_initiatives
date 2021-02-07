class Qualification < ApplicationRecord
  belongs_to :student
  validates :qualification_1st, length: { maximum: 50 }
  validates :qualification_2nd, length: { maximum: 50 }
  validates :qualification_3rd, length: { maximum: 50 }
  validates :qualification_4th, length: { maximum: 50 }
  validates :qualification_5th, length: { maximum: 50 }
  validates :note, length: { maximum: 500 } 
end
