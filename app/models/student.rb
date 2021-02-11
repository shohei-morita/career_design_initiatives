class Student < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :apealing_point, dependent: :destroy
  has_one :apealing_image, dependent: :destroy
  has_one :apealing_video, dependent: :destroy
  has_one :educational_background, dependent: :destroy
  has_one :qualification, dependent: :destroy
  has_many :extracurricular_activities, dependent: :destroy
  has_many :awards, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :target_lists, dependent: :destroy
  has_many :student_desirable_conditions, dependent: :destroy
  has_many :conditions, through: :student_desirable_conditions
  has_many :industries, through: :student_desirable_conditions, source: :condition
  has_many :occupations, through: :student_desirable_conditions, source: :condition
  has_many :workstyles, through: :student_desirable_conditions, source: :condition
  has_many :workplaces, through: :student_desirable_conditions, source: :condition

  include StringNormalizer

  before_create :default_image

  before_validation do
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name_kana,
            format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' },
            allow_blank: true
  validates :given_name_kana,
            format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' },
            allow_blank: true

  validates :graduation_year, presence: true, on: :create

  enum graduation_year: { '2021': 0, '2022': 1, other: 2 }
  enum gender: { 男性: 0, 女性: 1, その他: 2 }

  def default_image
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'no_image.png')),
      filename: 'no_image.png', content_type: 'image/png'
    )
  end

  def create_scout!(current_student)
    temp = Notification.where(["student_id = ? and recruiter_id = ?"])
  end

  def thumbnail
    avatar.variant(resize: '150x150').processed
  end

  def profile_image
    avatar.variant(resize: '300x300').processed
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

  def active_for_authentication?
    if suspended == false
      super && !suspended?
    end
  end

  def inactive_message
    suspended? ? super : 'アカウントが凍結されています'
  end
end
