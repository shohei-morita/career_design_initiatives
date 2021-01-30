class ScoutMessage < ApplicationRecord
  belongs_to :scout

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
