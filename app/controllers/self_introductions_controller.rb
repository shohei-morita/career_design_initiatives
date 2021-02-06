class SelfIntroductionsController < ApplicationController
  before_action :set_student, only: %i[show edit update]
  before_action :authenticate_student!
  before_action :self_introduction_path

  def new
    @student = Student.find(params[:student_id])
    @self_introduction = @student.send("build_#{set_type}")
  end

  def create
    @student = Student.find(params[:student_id])
    @self_introduction = @student.send("build_#{set_type}", self_introduction_params)

    if @self_introduction.save
      redirect_to controller: :self_introductions, action: :show, id: @student.id
    else
      render :new
    end
  end

  def show
    @self_introduction = @student.send(set_type)
  end

  def edit
    @self_introduction = @student.send(set_type)
  end

  def update
    @self_introduction = @student.send(set_type)
    if @self_introduction.update(self_introduction_params)
      redirect_to controller: :self_introductions, action: :show, id: @student.id
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def type
    params[:type]
  end

  def set_type
    type.underscore
  end

  def self_introduction_params
    params.require(set_type.to_sym).permit(:type, :title, :content, :student_id, :image, :video)
  end

  def self_introduction_path
    @self_introduction_path = "student_#{set_type}_path"
  end
end
