class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :graduation_year, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  enum which_year: { "2021": 0, "2022": 1, other: 2 }

  private

  def downcase_email
    self.email = email.downcase
  end
end
