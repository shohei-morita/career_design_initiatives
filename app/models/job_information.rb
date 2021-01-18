class JobInformation < ApplicationRecord
  belongs_to :company
  enum status: { 準備中: 0, 公開中: 1 }
end
