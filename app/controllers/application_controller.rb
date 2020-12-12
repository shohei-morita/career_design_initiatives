class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[graduation_year])
    devise_parameter_sanitizer.permit(:update, keys: %i[graduation_year])
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
