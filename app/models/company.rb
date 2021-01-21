class Company < ApplicationRecord
  belongs_to :recruiter
  has_many :job_informations
  validates :name, presence: true
  validates :foundation_year, presence: true
  validates :president_name, presence: true
  validates :capital, presence: true
  validates :number_of_employees, presence: true, length: { maximum: 500 }
  validates :business_outline, length: { maximum: 1000 }
  validates :revenue, length: { maximum: 500 }
end
