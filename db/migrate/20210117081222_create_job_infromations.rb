class CreateJobInfromations < ActiveRecord::Migration[5.2]
  def change
    create_table :job_infromations do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :appealing_point, null: false
      t.text :pay, null: false
      t.text :working_status, null: false
      t.text :working_hour, null: false
      t.text :benefit, null: false
      t.text :day_off, null: false
      t.text :selection, null: false
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
