class CreateSelfIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :self_introductions do |t|
      t.string :type
      t.string :title
      t.text :content
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
