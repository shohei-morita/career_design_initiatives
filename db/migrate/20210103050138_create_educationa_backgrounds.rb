class CreateEducationaBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :educationa_backgrounds do |t|
      t.integer :educational_history, null: false
      t.integer :location, null: false
      t.integer :division, null: false
      t.string :school_name, null: false
      t.date :entrance_date, null: false
      t.date :guraduation_date, null: false
      t.text :note

      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
