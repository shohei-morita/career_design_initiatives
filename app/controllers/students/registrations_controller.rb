# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  def update
    super
    if account_update_params[:avatar].present?
      resource.avatar.attach(account_update_params[:avatar])
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    student_path(current_student.id)
  end
end
