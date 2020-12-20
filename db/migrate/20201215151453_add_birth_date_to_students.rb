class AddBirthDateToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :birth_date, :date
  end
end
