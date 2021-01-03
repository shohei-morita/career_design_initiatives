class Student < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :apealing_point, dependent: :destroy
  has_one :apealing_image, dependent: :destroy
  has_one :apealing_video, dependent: :destroy
  has_one :educational_background, dependent: :destroy

  include StringNormalizer

  before_validation do
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }, allow_blank: true
  validates :given_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }, allow_blank: true

  validates :graduation_year, presence: true, on: :create

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
end
