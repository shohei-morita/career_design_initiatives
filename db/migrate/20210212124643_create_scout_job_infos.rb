class CreateScoutJobInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :scout_job_infos do |t|
      t.references :job_information, foreign_key: true
      t.references :scout, foreign_key: true
      t.timestamps
    end
  end
end
