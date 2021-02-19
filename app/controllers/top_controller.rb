class TopController < ApplicationController
  def top
    if current_student
      redirect_to home_students_path
    elsif current_recruiter.try(:admin) == false
      redirect_to home_recruiters_path
    elsif current_recruiter.try(:admin) == true
      redirect_to admin_recruiters_path
    else
      render :top
    end
  end

  def company
  end

  def application_completion; end
end
