class EducationalBackgroundsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student

  def new
    @educational_background = EducationalBackground.new
  end

  def create
    @educational_background = EducationalBackground.build_educational_background(educational_background_params)

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
    if @educational_background.update(address_params)
      redirect_to student_educational_background_path(current_student.id)
    else
      render :edit
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
end
