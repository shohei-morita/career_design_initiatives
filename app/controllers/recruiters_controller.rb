class RecruitersController < ApplicationController
  before_action :authenticate_recruiter!
  before_action :scout_info, only: %i[search_student]

  PER = 10

  def index
    @scouts = current_recruiter.scouts.all
  end

  def recruiter_settings; end

  def search_student
    @search = Student.ransack(params[:q])
    @result_students = @search.result(distinct: true)
    @student_pages = @result_students.page(params[:page]).per(PER)
  end

  private

  def scout_info
    scouts = current_recruiter.scouts
    @scout_ids = []
    scouts.each do |s|
      @scout_ids << s.student_id
    end
  end
end
