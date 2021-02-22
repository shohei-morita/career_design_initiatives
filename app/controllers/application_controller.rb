class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def same_student
    unless @student.try(:id) == current_student.id
      redirect_to students_path, notice: "他人のページにはアクセスできません"
    end
  end

  def same_recruiter
    unless @recruiter.id == current_recruiter.id
      redirect_to recruiters_path, notice: "他社のページにはアクセスできません"
    end
  end

  protected
  def authenticate_student_and_recruiter
    if not student_signed_in? || recruiter_signed_in?
      redirect_to root_path, 'アカウントを作成してください'
    end
  end

  def configure_permitted_parameters
    if resource_class == Student
      student_attributes = %i(family_name given_name family_name_kana given_name_kana
                              nickname tel gender graduation_year birth_date avatar address)
      devise_parameter_sanitizer.permit(:sign_up, keys: student_attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: [student_attributes, condition_ids:[]])

    elsif resource_class == Recruiter && Company
      recruiter_attributes = %i(family_name given_name family_name_kana given_name_kana
                               fax tel department title avatar)

      company_attributes = %i(name foundation_year capital president_name url
                              number_of_employees business_outline revenue)

      password_attributes = %i(password password_confirmation current_password)

      devise_parameter_sanitizer.permit(:sign_up, keys: [recruiter_attributes, company_attributes: [company_attributes]])
      devise_parameter_sanitizer.permit(:account_update, keys: [recruiter_attributes, company_attributes: [company_attributes], password_attributes: [password_attributes]])
    else
      super
    end
  end

  def after_sign_in_path_for(resource)
    if current_student
      students_path
    elsif current_recruiter.admin? == false
      recruiters_path
    elsif current_recruiter.admin? == true
      home_admin_recruiters_path
    else
      flash[:notice] = "新規登録が完了しました！"
      students_path
    end
  end
end
