# frozen_string_literal: true

module Recruiters
  class RegistrationsController < Devise::RegistrationsController
    prepend_before_action :authenticate_scope!, only: %i[edit update destroy edit_password update_password
                                                         show_profile edit_profile update_profile]
    prepend_before_action :set_minimum_password_length, only: %i[new edit edit_password]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    def new
      @recruiter = Recruiter.new
      @company = @recruiter.build_company
    end

    def confirm
      build_resource(sign_up_params)
      render :new if resource.invalid?
    end

    # POST /resource
    def create
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    def edit_password; end

    def update_password
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        respond_with resource, location: after_password_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        render 'edit_password'
      end
    end

    def show_profile; end

    def edit_profile; end

    def update_profile
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        respond_with resource, location: after_profile_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        render 'edit_profile'
      end
    end

    protected

    def update_resource(resource, params)
      if action_name == 'update_password'
        resource.update_with_password(params)
      else
        resource.update_without_password(params)
      end
    end

    def after_profile_update_path_for(_resource)
      show_profile_path(current_recruiter)
    end

    def after_password_update_path_for(_resource)
      settings_recruiters_path(current_recruiter)
    end

    def after_inactive_sign_up_path_for(_resource)
      top_applicaiton_completion_path
    end
  end
end
