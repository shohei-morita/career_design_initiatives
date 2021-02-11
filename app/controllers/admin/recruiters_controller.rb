module Admin
  class RecruitersController < ApplicationController
    before_action :if_not_admin
    before_action :set_recruiter, only: %i[show edit update destroy]
    before_action :authenticate_recruiter!

    def index
      @recruiters = if params[:approved] == 'false'
                      Recruiter.where(approved: false)
                    else
                      Recruiter.all
                    end
    end

    def show; end

    def edit; end

    def update
      if params[:back]
        redirect_to admin_recruiters_path
      elsif params[:approved]
        @recruiter.approved = true
        @password = Devise.friendly_token.first(8)
        @recruiter.password = @password
        RegistrationMailer.approval(@recruiter, @password).deliver
        @recruiter.save
        redirect_to edit_admin_recruiter_path(@recruiter.id)
      elsif params[:suspended]
        @recruiter.suspended = true
        @recruiter.save
        redirect_to edit_admin_recruiter_path(@recruiter.id)
      elsif params[:release]
        @recruiter.suspended = false
        @recruiter.save
        redirect_to edit_admin_recruiter_path(@recruiter.id)
      else
        render :edit
      end
    end

    def destroy
      @recruiter = Recruiter.find(params[:id])
      if @recruiter.destroy
        redirect_to admin_recruiters_path, danger: 'ユーザを削除しました'
      else
        redirect_to admin_recruiters_path
      end
    end

    private

    def if_not_admin
      redirect_to root_path unless current_recruiter.admin?
    end

    def recruiter_params
      params.require(:recruiter).permit(
        :family_name, :given_name, :family_name_kana, :given_name_kana,
        :department, :title, :tel, :fax, :email, :admin, :approved,
        :suspended, :password, :password_confirmation
      )
    end

    def set_recruiter
      @recruiter = Recruiter.find(params[:id])
    end
  end
end
