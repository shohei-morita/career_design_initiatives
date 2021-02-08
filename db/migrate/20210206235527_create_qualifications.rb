class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :qualification_1st
      t.string :qualification_2nd
      t.string :qualification_3rd
      t.string :qualification_4th
      t.string :qualification_5th
      t.text :note
      t.timestamps
    end
  end
end
