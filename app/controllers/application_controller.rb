class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    student_attributes = %i(family_name given_name family_name_kana given_name_kana nickname tel gender graduation_year birth_date)
    devise_parameter_sanitizer.permit(:sign_up, keys: student_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: student_attributes)
  end

  def after_sign_in_path_for(resource)
    if current_student
      student_path(current_student.id)
    else
      flash[:notice] = "新規登録が完了しました！"
      student_path(current_student.id)
    end
  end
end
