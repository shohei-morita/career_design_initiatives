class CreateTargetLists < ActiveRecord::Migration[5.2]
  def change
    create_table :target_lists do |t|
      t.references :student, foreign_key: true
      t.references :recruiter, foreign_key: true
      t.timestamps
    end
  end
end
