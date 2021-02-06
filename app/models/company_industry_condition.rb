class CompanyIndustryCondition < ApplicationRecord
  belongs_to :company
  belongs_to :condition
end
