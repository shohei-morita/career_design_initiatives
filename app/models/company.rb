class Company < ApplicationRecord
  belongs_to :recruiter
  validates :name, presence: true
  validates :foundation_year, presence: true
  validates :president_name, presence: true
  validates :capital, presence: true
  validates :number_of_employees, presence: true, numericality: { message: 'は正の整数で入力してください' }, length: { maximum: 7 }
  validates :business_outline, length: { maximum: 1000 }
  validates :revenue, length: { maximum: 500 }
end
