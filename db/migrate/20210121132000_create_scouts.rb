class CreateScouts < ActiveRecord::Migration[5.2]
  def change
    create_table :scouts do |t|
      t.string :title, null: false
      t.references :recruiter, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
