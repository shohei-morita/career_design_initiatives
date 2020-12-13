class AddGrauationYearToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :graduation_year, :integer, null: false
  end
end
