class JobInfromation < ApplicationRecord
  belongs_to :company, dependent: :destroy
end
