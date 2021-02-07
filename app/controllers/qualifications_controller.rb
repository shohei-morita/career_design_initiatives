class QualificationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student

  def new
    @qualification = Qualification.new
  end

  def create
    @qualification = @student.build_qualification(qualification_params)

    if @qualification.save
      redirect_to student_qualification_path(current_student.id)
    else
      render :new
    end
  end

  def show
    @qualification = @student.qualification
  end

  def edit
    @qualification = @student.qualification
  end

  def update
    @qualification = @student.qualification
    if @qualification.update(qualification_params)
      redirect_to student_qualification_path(current_student.id)
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def qualification_params
    params.require(:qualification).permit(:student_id, :location, :division, :school_name,
                                                   :entrance_date, :graduation_date, :note)
  end
end
