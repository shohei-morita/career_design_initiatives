class CreateAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :awards do |t|
      t.string :title
      t.date :year
      t.text :summary
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
