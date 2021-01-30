class RemoveTitleFromScoutMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :scout_messages, :title, :string
  end
end
