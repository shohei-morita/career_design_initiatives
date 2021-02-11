class ScoutsController < ApplicationController
  before_action :authenticate_student_and_recruiter, only: %i[index]
  before_action :authenticate_recruiter!, only: %i[new create]

  def index
    if recruiter_signed_in?
      @scouts = current_recruiter.scouts.all
    elsif student_signed_in?
      @scouts = current_student.scouts.all
    end
  end

  def new
    @scout = Scout.new
    @scout.scout_messages.build
  end

  def create
    @scout = Scout.new(scout_params)
    if @scout.save
      notification = Notification.create(
        object: 'student',
        object_id: @scout.student_id,
        action: 'scout',
        action_id: @scout.id,
      )
      notification.message = notification.new_message
      notification.save
      redirect_to scout_scout_messages_path(@scout.id), notice: 'スカウトを送信しました'
    else
      redirect_to request.referrer, flash: { error: @scout.errors.full_messages }
      #render :new, notice: 'スカウトを送信できませんでした'
    end
  end

  private

  def scout_params
    params.require(:scout).permit(
      :student_id, :recruiter_id, :title,
      scout_messages_attributes: %i[id scout_id recruiter_id content read_unread]
    )
  end
end
