class CreateScoutMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :scout_messages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :read_unread, null: false
      t.references :scout, foreign_key: true
      t.timestamps
    end
  end
end
