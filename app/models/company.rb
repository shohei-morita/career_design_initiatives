class Company < ApplicationRecord
  belongs_to :recruiter
  has_many :job_information, dependent: :destroy
  has_many :company_industry_conditions, dependent: :destroy
  has_many :conditions, through: :company_industry_conditions
  has_many :industries, through: :company_industry_conditions, source: :condition

  validates :name, presence: true
  validates :foundation_year, presence: true
  validates :president_name, presence: true
  validates :capital, presence: true
  validates :number_of_employees, presence: true, length: { maximum: 500 }
  validates :business_outline, length: { maximum: 1000 }
  validates :revenue, length: { maximum: 500 }
end
