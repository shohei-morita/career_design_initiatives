class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : 'アカウントがまだ承認されていません'
  end

  def password_required?
    super && confirmed_at
  end
end
