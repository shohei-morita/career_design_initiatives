class Scout < ApplicationRecord
  belongs_to :recruiter
  belongs_to :student

  has_many :scout_messages, dependent: :destroy
  accepts_nested_attributes_for :scout_messages
end
