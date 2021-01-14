class Company < ApplicationRecord
  belongs_to :recruiter
  validates :name, presence: true, length: { maximum: 50 }
  validates :foudation_year, presence: true
  validates :president_name, presence: true, length: { maximum: 50 }
  validates :capital, presence: true, length: { maximum: 50 }
  validates :number_of_employees, presence: true, length: { maximum: 6 }
  validates :business_outline, length: { maximum: 1000 }
  validates :revenue, length: { maximum: 500 }
end
