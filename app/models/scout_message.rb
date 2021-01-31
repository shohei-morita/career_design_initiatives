class ScoutMessage < ApplicationRecord
  belongs_to :scout
  validates :content, presence: true, length: { maximum: 1000 }

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
