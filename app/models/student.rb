class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # before_save :downcase_email
  # VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  # validates :email, presence: true, length: { maximum: 50 },
  #                  format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: true
  # validates :graduation_year, presence: true
  # validates :password, presence: true, length: { minimum: 6 }

  enum graduation_year: { '2021': 0, '2022': 1, other: 2 }
  enum gender: { 男性: 0, 女性: 1, その他: 2 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
