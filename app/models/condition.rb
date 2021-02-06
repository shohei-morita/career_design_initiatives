class Condition < ApplicationRecord
  has_many :job_information_conditions, dependent: :destroy
  has_many :company_industry_conditions, dependent: :destroy
  has_many :student_desirable_conditions, dependent: :destroy
  has_many :job_informations, through: :job_information_conditions
  has_many :companies, through: :company_industry_conditions
  has_many :students, through: :student_desirable_conditions
end
