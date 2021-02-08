class Qualification < ApplicationRecord
  belongs_to :student
  validates :qualification_1st, length: { maximum: 50 }
  validates :qualification_2nd, length: { maximum: 50 }
  validates :qualification_3rd, length: { maximum: 50 }
  validates :qualification_4th, length: { maximum: 50 }
  validates :qualification_5th, length: { maximum: 50 }
  validates :qualification_any, presence: true
  validates :note, length: { maximum: 500 }

  private
    def qualification_any
      qualification_1st.presence or qualification_2nd.presence or qualification_3rd.presence or qualification_4th.presence or qualification_5th.presence
    end
end
