class RecruitersController < ApplicationController
  before_action :authenticate_recruiter!

  def home
    @scouts = current_recruiter.scouts.all
  end

  def recruiter_settings; end
end
