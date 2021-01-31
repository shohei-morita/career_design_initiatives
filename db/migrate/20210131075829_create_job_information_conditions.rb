class CreateJobInformationConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :job_information_conditions do |t|
      t.references :job_information, foreign_key: true
      t.references :condition, foreign_key: true
      t.timestamps
    end
  end
end
