class JobInformationCondition < ApplicationRecord
  belongs_to :job_information
  belongs_to :condition
end
