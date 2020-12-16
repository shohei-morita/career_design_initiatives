# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    student_path(current_student.id)
  end
end
