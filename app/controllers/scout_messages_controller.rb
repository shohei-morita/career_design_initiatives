class ScoutMessagesController < ApplicationController
  before_action do
    @scout = Scout.find(params[:scout_id])
  end

  before_action :authenticate_student_and_recruiter

  def index
    unless @scout.student_id == current_student.try(:id) || @scout.recruiter_id == current_recruiter.try(:id)
      redirect_to scouts_path
    end

    if student_signed_in?
      @scout.read_unread = true
      @scout.save
    end

    @scout_messages = @scout.scout_messages.order(created_at: 'ASC')
    @recruiter = @scout.recruiter

    if @scout_messages.length > 10
      @over_ten = true
      @scout_messages = ScoutMessage.where(id: @scout_messages[-10..].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @scout_messages = @scout.scout_messages.order(created_at: 'ASC')
    end

    @scout_messages.where(student_id: nil).update_all(read_unread: true) if @scout_messages.last && student_signed_in?

    if @scout_messages.last && recruiter_signed_in?
      @scout_messages.where(recruiter_id: nil).update_all(read_unread: true)
    end

    @scout_message = @scout.scout_messages.build
  end

  def create
    @scout_messages = @scout.scout_messages.order(created_at: 'ASC')
    @recruiter = @scout.recruiter

    @scout_message = @scout.scout_messages.build(scout_message_params)
    if @scout_message.save
      if @scout_message.recruiter_id
        notification = Notification.create(
          object: 'student',
          object_id: @scout.student_id,
          action: 'scoutmessage',
          action_id: @scout_message.id,
        )
        notification.message = notification.new_message
        notification.save
      elsif @scout_message.student_id
        notification = Notification.create(
          object: 'recruiter',
          object_id: @scout.recruiter_id,
          action: 'scoutmessage',
          action_id: @scout_message.id,
        )
        notification.message = notification.new_message
        notification.save
      end
      redirect_to scout_scout_messages_path(@scout.id)
    else
      render 'index'
    end
  end

  private

  def scout_message_params
    params.require(:scout_message).permit(:scout_id, :content, :recruiter_id, :student_id)
  end
end
