class ChangeDataNumberOfEmployeesOfCompany < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :number_of_employees, :text
  end
end
