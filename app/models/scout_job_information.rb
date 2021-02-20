class ScoutJobInformation < ApplicationRecord
  belongs_to :job_information
  belongs_to :scout
end
