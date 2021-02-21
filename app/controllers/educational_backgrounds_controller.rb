class EducationalBackgroundsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student
  before_action :same_student, only: %i[new show edit]

  def new
    @educational_background = EducationalBackground.new
  end

  def create
    @educational_background = @student.build_educational_background(educational_background_params)

    if @educational_background.save
      redirect_to student_educational_background_path(current_student.id)
    else
      render :new
    end
  end

  def show
    @educational_background = @student.educational_background
  end

  def edit
    @educational_background = @student.educational_background
  end

  def update
    @educational_background = @student.educational_background
    if @educational_background.update(educational_background_params)
      redirect_to student_educational_background_path(current_student.id)
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find_by(id: params[:student_id])
  end

  def educational_background_params
    params.require(:educational_background).permit(:student_id, :location, :division, :school_name,
                                                   :entrance_date, :graduation_date, :note)
  end
end
