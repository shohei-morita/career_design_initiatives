class CompaniesController < ApplicationController
  before_action :authenticate_recruiter!
  before_action :set_recruiter

  def show
  end

  def edit
    @company = @recruiter.company
  end

  def update
    if @company = @recruiter.company.update(company_params)
      redirect_to recruiter_company_path(current_recruiter.id)
    else
      reder :edit
    end
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find(params[:recruiter_id])
  end

  def company_params
    params.require(:company).permit(:recruiter_id, :name, :foundation_year, :capital, :president_name,
                                    :number_of_employees, :url, :business_outline)
  end

end
