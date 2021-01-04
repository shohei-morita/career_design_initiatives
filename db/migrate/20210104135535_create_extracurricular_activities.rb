class CreateExtracurricularActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :extracurricular_activities do |t|
      t.string :name, null: false
      t.date :beginning_year, null: false
      t.date :ending_year
      t.text :summary
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
