class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    student_attribute = %i[
      family_name
      given_name
      family_name_kana
      given_name_kana
      nickname
      tel
      gender
      birth_year
      birth_month
      birth_day
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: student_attribute)
    devise_parameter_sanitizer.permit(:update, keys: student_attribute)
  end
end
