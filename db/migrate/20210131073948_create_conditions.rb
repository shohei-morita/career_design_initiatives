class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :type
      t.integer :name
      t.timestamps
    end
  end
end
