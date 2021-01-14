# frozen_string_literal: true

module Recruiters
  class SessionsController < Devise::SessionsController
    def update
      super
      resource.avatar.attach(account_update_params[:avatar]) if account_update_params[:avatar].present?
    end

    protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

    def after_update_path_for(_resource)
      recruiter_path(current_recruiter.id)
    end
  end
end
