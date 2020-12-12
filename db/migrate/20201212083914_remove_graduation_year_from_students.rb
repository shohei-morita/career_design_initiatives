class RemoveGraduationYearFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :graduation_year, :date
  end
end
