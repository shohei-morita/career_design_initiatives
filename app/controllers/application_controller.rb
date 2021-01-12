class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_student!

  protected

  def configure_permitted_parameters
    if resource_class == Student
      student_attributes = %i(family_name given_name family_name_kana given_name_kana
                              nickname tel gender graduation_year birth_date avatar)
      devise_parameter_sanitizer.permit(:sign_up, keys: student_attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: student_attributes)

    elsif resource_class == Recruiter && Company
      recruiter_attributes = %i(family_name given_name family_name_kana given_name_kana
                               fax tel department title avatar name foundation_year capital
                               president_name url number_of_employees business_outline)

      company_attributes = %i(name foundation_year capital president_name url
                              number_of_employees business_outline revenue)
      devise_parameter_sanitizer.permit(:sign_up, keys: [recruiter_attributes, company_attributes: [company_attributes]])
      devise_parameter_sanitizer.permit(:account_update, keys: [recruiter_attributes, company_attributes: [company_attributes]])



    else
      super
    end
  end

  def after_sign_in_path_for(resource)
    if current_student
      home_students_path
    elsif current_recruiter.admin? == false
      home_recruiters_path
    elsif current_recruiter.admin? == true
      admin_recruiters_path
    else
      flash[:notice] = "新規登録が完了しました！"
      home_students_path
    end
  end
end
