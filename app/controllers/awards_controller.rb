class AwardsController < ApplicationController
  before_action :authenticate_student!, only: %i[index new create edit update destroy]
  before_action :authenticate_student_and_recruiter, only: %i[show]
  before_action :set_student
  before_action :same_student, only: %i[index new edit]

  def index
    @awards = current_student.awards.all.order(year: 'ASC')
  end

  def new
    @award = Award.new
  end

  def create
    @award = @student.awards.build(award_params)
    if @award.save
      redirect_to student_awards_path
    else
      render :new
    end
  end

  def show
    same_student if student_signed_in?
    @award = @student.awards.find(params[:id])
  end

  def edit
    @award = @student.awards.find(params[:id])
  end

  def update
    @award = @student.awards.find(params[:id])
    if @award.update(award_params)
      redirect_to student_awards_path
    else
      render :edit
    end
  end

  def destroy
    @award = @student.awards.find(params[:id])
    @award.destroy
    flash[:danger] = '表彰情報を削除しました'
    redirect_to student_awards_path
  end

  private

  def set_student
    @student = Student.find_by(id: params[:student_id])
  end

  def award_params
    params.require(:award).permit(:student_id, :title, :year, :summary)
  end
end
