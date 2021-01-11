class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include StringNormalizer

  before_validation do
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  before_validation do
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  validates :family_name, presence: true, length: { maximum: 50 }
  validates :given_name, presence: true, length: { maximum: 50 }
  validates :department, presence: true, length: { maximum: 50 }
  validates :tel, presence: true

  validates :family_name_kana, presence: true,
                               format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
  validates :given_name_kana, presence: true,
                              format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : 'アカウントがまだ承認されていません'
  end

  def password_required?
    super && confirmed_at
  end

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
end
