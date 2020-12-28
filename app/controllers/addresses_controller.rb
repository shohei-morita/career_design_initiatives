class AddressesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_student, only: %i[create show edit update]

  def new
    @address = Address.new
  end

  def create
    @address = @student.build_address(address_params)

    if @address.save
      redirect_to student_address_path(current_student.address.id)
    else
      render :new
    end
  end

  def show; end

  def edit
    @address = Address.find(params[:student_id])
  end

  def update
    @address = @student.address
    redirect_to student_address_path(current_student.address.id) if @address.update(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:student_id, :postcode, :prefecture_code,
                                    :address_city, :address_street, :address_building)
  end

  def set_student
    @student = Student.find(params[:student_id])
  end
end
