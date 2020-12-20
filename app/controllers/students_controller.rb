class StudentsController < ApplicationController
  before_action :set_params, only: %i[profile show]

  def home; end

  def profile; end

  def show; end

  private

  def set_params
    @student = Student.find(params[:id])
  end
end
