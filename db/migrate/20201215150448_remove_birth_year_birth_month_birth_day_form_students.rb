class RemoveBirthYearBirthMonthBirthDayFormStudents< ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :birth_year, :date
    remove_column :students, :birth_month, :date
    remove_column :students, :birth_day, :date
  end
end
