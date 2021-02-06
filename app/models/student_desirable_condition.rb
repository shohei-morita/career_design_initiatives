class StudentDesirableCondition < ApplicationRecord
  belongs_to :student
  belongs_to :condition
end
