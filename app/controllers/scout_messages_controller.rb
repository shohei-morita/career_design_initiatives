class ScoutMessagesController < ApplicationController
  before_action do
    @scout = Scout.find(params[:scout_id])
  end

  before_action :authenticate_student_and_recruiter

  def index
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
