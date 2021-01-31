class ScoutsController < ApplicationController
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
      redirect_to scout_scout_messages_path(@scout.id), notice: 'スカウトを送信しました'
    else
      render :new, notice: 'スカウトを送信できませんでした'
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
