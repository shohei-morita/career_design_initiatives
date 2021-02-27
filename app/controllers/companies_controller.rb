class CompaniesController < ApplicationController
  before_action :authenticate_recruiter!, only: %i[edit update]
  before_action :authenticate_student_and_recruiter, only: %i[show]
  before_action :set_company
  before_action :same_recruiter, only: %i[edit]

  def show; end

  def edit; end

  def update
    if @recruiter.company.update(company_params)
      redirect_to recruiter_company_path(current_recruiter.id)
    else
      render :edit
    end
  end

  private

  def set_company
    @recruiter = Recruiter.find_by(id: params[:recruiter_id])
    @company = @recruiter.company
  end

  def company_params
    params.require(:company).permit(
      :recruiter_id, :name, :foundation_year, :capital, :president_name,
      :number_of_employees, :url, :business_outline, :revenue, condition_ids:[]
    )
  end
end
