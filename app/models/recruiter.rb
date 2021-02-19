class Recruiter < ApplicationRecord
  has_one :company
  accepts_nested_attributes_for :company

  has_many :scouts, dependent: :destroy
  has_many :target_lists, dependent: :destroy
  has_many :students, through: :target_lists
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

  VALID_TEL_NUMBER_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/.freeze

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :department, presence: true
  validates :tel, presence: true, format: { with: VALID_TEL_NUMBER_REGEX,
                                            message: 'は数字のみもしくはハイフン（ー）を含んだ形式で入力してください' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は「カタカナ」もしくは「ひらがな」で入力してください' }
  validates :given_name_kana, presence: true,
                              format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は「カタカナ」もしくは「ひらがな」で入力してください' }

  def active_for_authentication?
    if approved == false
      super && approved?
    elsif approved == true && suspended == false
      super && !suspended?
    end
  end

  def inactive_message
    approved? ? super : 'アカウントがまだ承認されていません' || suspended? ? super : 'アカウントが凍結されています'
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
