class RecruitersController < ApplicationController
  # before_action :set_params, only: %i[show]

  def home; end

  def recruiter_settings; end

  private

  def set_params
    @recruiter = Recruiter.find(params[:id])
  end
end
