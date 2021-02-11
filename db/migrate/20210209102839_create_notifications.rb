class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :object
      t.integer :object_id
      t.string :action
      t.integer :action_id
      t.string :message
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
