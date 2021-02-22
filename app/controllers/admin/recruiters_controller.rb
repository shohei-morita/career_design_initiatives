module Admin
  class RecruitersController < ApplicationController
    before_action :if_not_admin
    before_action :set_recruiter, only: %i[edit update destroy]
    before_action :set_student, only: %i[edit_student update_student destroy_student]
    before_action :authenticate_recruiter!

    PER = 10

    def top; end

    def index
      @search = Recruiter.ransack(params[:q])
      @result_recruiters = @search.result(distinct: true)
      @recruiter_pages = @result_recruiters.page(params[:page]).per(PER)
    end

    def student_index
      @search = Student.ransack(params[:q])
      @result_students = @search.result(distinct: true)
      @student_pages = @result_students.page(params[:page]).per(PER)
    end

    def edit; end

    def update
      if params[:approved]
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
      elsif params[:reissue]
        @password = Devise.friendly_token.first(8)
        @recruiter.password = @password
        RegistrationMailer.reissue_recruiter(@recruiter, @password).deliver
        @recruiter.save
        redirect_to edit_admin_recruiter_path(@recruiter.id)
      else
        render :edit
      end
    end

    def destroy
      if @recruiter.destroy
        redirect_to admin_recruiters_path, danger: 'ユーザを削除しました'
      else
        redirect_to admin_recruiters_path
      end
    end

    def edit_student; end

    def update_student
      if params[:suspended]
        @student.suspended = true
        @student.save
        redirect_to edit_student_admin_recruiter_path(@student.id)
      elsif params[:release]
        @student.suspended = false
        @student.save
        redirect_to edit_student_admin_recruiter_path(@student.id)
      elsif params[:reissue]
        @password = Devise.friendly_token.first(8)
        @student.password = @password
        RegistrationMailer.reissue_student(@student, @password).deliver
        @student.save
        redirect_to edit_student_admin_recruiter_path(@student.id)
      else
        render :edit_student
      end
    end

    def destroy_student
      if @student.destroy
        redirect_to admin_recruiters_path, danger: 'ユーザを削除しました'
      else
        redirect_to admin_recruiters_path
      end
    end


    private

    def if_not_admin
      redirect_to root_path unless current_recruiter.admin?
    end

    def set_recruiter
      @recruiter = Recruiter.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:id])
    end
  end
end
