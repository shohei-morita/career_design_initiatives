class NotificationsController < ApplicationController
  before_action :authenticate_student_and_recruiter
  def index
    @notifications = Notification.where(object_id: current_recruiter.id).order(created_at: "DESC") if recruiter_signed_in?
    @notifications = Notification.where(object_id: current_student.id).order(created_at: "DESC") if student_signed_in?
  end

  def show
    @notification = Notification.find_by(id: params[:id])
    @notification.checked = true
    @notification.save
    redirect_to @notification.path_info
  end
end
