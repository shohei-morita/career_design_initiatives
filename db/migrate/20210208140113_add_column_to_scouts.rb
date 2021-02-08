class AddColumnToScouts < ActiveRecord::Migration[5.2]
  def change
    add_column :scouts, :read_unread, :boolean, default: false
  end
end
