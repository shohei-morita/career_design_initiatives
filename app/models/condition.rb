class Condition < ApplicationRecord
  #belongs_to :student

  validates :name, presence: true

  scope :industry, -> { where(type: 'Industry') }
  scope :occupation, -> { where(type: 'Occupation') }
  scope :Workplace, -> { where(type: 'Workplace') }
  scope :Workstyle, -> { where(type: 'Workstyle') }
end
