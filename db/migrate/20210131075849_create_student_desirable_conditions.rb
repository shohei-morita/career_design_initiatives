class CreateStudentDesirableConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_desirable_conditions do |t|
      t.references :student, foreign_key: true
      t.references :condition, foreign_key: true
      t.timestamps
    end
  end
end
