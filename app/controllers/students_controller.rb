class StudentsController < ApplicationController
  before_action :authenticate_recruiter!, only: %i[index company_show]
  before_action :authenticate_student!, only: %i[hom profile pr show]
  before_action :set_params, only: %i[show company_show]
  before_action :scout_info, only: %i[index company_show]
  before_action :same_student, only: %i[show]

  PER = 10

  def index
    @search = Student.ransack(params[:q])
    @result_students = @search.result(distinct: true)
    @student_pages = @result_students.page(params[:page]).per(PER)
  end

  def home; end

  def profile; end

  def pr; end

  def show
    same_student
  end

  def company_show
    @target_list = current_recruiter.target_lists.find_by(student_id: @student.id)
  end

  private

  def set_params
    @student = Student.find_by(id: params[:id])
  end

  def scout_info
    scouts = current_recruiter.scouts
    @scout_ids = []
    scouts.each do |s|
      @scout_ids << s.student_id
    end
  end
end
