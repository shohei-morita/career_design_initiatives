class ExtracurricularActivitiesController < ApplicationController
  before_action :authenticate_student!, only: %i[index new create edit update destroy]
  before_action :authenticate_student_and_recruiter, only: %i[show]
  before_action :set_student
  before_action :same_student, only: %i[index new show edit]

  def index
    @extracurricular_activities = current_student.extracurricular_activities.all.order(beginning_year: 'ASC')
  end

  def new
    @extracurricular_activity = ExtracurricularActivity.new
  end

  def create
    @extracurricular_activity = @student.extracurricular_activities.build(extracurricular_activity_params)
    if @extracurricular_activity.save
      redirect_to student_extracurricular_activities_path
    else
      render :new
    end
  end

  def show
    @extracurricular_activity = ExtracurricularActivity.find(params[:id])
  end

  def edit
    @extracurricular_activity = @student.extracurricular_activities.find(params[:id])
  end

  def update
    @extracurricular_activity = @student.extracurricular_activities.find(params[:id])
    if @extracurricular_activity.update(extracurricular_activity_params)
      redirect_to student_extracurricular_activities_path
    else
      render :edit
    end
  end

  def destroy
    @extracurricular_activity = @student.extracurricular_activities.find(params[:id])
    @extracurricular_activity.destroy
    flash[:danger] = '課外活動を削除しました'
    redirect_to student_extracurricular_activities_path
  end

  private

  def set_student
    @student = Student.find_by(id: params[:student_id])
  end

  def extracurricular_activity_params
    params.require(:extracurricular_activity).permit(:student_id, :name, :beginning_year,
                                                     :ending_year, :summary)
  end
end
