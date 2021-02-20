class JobInformationController < ApplicationController
  before_action :set_recruiter
  before_action :authenticate_student_and_recruiter, only: %i[show]
  before_action :authenticate_recruiter!, only: %i[index new create edit update destroy]

  def index
    @draft_job_information = current_recruiter.company.job_information.where(status: 0)
    @open_job_information = current_recruiter.company.job_information.where(status: 1)
  end

  def new
    @job_information = JobInformation.new
  end

  def create
    @job_information = @recruiter.company.job_information.build(job_information_params)
    if @job_information.save
      redirect_to recruiter_job_information_index_path(current_recruiter.id)
    else
      render :new
    end
  end

  def show
    @job_information = @recruiter.company.job_information.find(params[:id])
    if @job_information.status == '準備中' && current_student
      redirect_to request.referer, notice: "求人は現在公開されていません"
    elsif @job_information.status == '準備中' && @recruiter.id != current_recruiter.id
      redirect_to request.referer, notice: "求人は現在公開されていません"
    end
  end

  def edit
    @job_information = @recruiter.company.job_information.find(params[:id])
  end

  def update
    @job_information = @recruiter.company.job_information.find(params[:id])
    if @job_information.update(job_information_params)
      redirect_to recruiter_job_information_index_path(current_recruiter.id)
    else
      render :edit
    end
  end

  def destroy
    @job_information = @recruiter.company.job_information.find(params[:id])
    @job_information.destroy
    flash[:danger] = '求人情報を削除しました'
    redirect_to recruiter_job_information_index_path
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find(params[:recruiter_id])
  end

  def job_information_params
    params.require(:job_information).permit(
      :recruiter_id, :title, :content, :appealing_point, :pay,
      :working_hour, :working_status, :benefit, :day_off, :selection,
      :workplace_detail, :status, condition_ids:[]
      )
  end
end
