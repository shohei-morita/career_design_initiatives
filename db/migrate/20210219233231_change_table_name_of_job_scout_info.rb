class ChangeTableNameOfJobScoutInfo < ActiveRecord::Migration[5.2]
  def change
    rename_table :scout_job_infos, :scout_job_information
  end
end
