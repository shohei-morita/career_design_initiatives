class Scout < ApplicationRecord
  belongs_to :recruiter
  belongs_to :student

  has_many :scout_messages, dependent: :destroy
  accepts_nested_attributes_for :scout_messages

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
