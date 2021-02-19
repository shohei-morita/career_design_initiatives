class AddColumnToJobInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :job_informations, :workplace_detail, :text
  end
end
