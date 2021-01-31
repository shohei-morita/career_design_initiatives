class TargetListsController < ApplicationController
  def index
    @targets = TargetList.all
    scouts = current_recruiter.scouts
    @scout_ids = []
    scouts.each do |s|
      @scout_ids << s.student_id
    end
  end

  def create
    target = current_recruiter.target_lists.create(student_id: params[:student_id])
    case params[:key]
    when 'index'
      redirect_to students_path
    when 'company_show'
      redirect_to company_show_student_path(target.student.id)
    else
      redirect_to target_lists_path
    end
  end

  def destroy
    target = current_recruiter.target_lists.find_by(id: params[:id])
    if target.nil?
      redirect_to students_path
    elsif target.destroy
      case params[:key]
      when 'index'
        redirect_to students_path
      when 'company_show'
        redirect_to comapny_show_student_path(target.student.id)
      else
        redirect_to target_lists_path
      end
    end
  end
end
