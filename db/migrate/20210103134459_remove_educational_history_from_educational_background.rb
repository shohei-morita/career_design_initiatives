class RemoveEducationalHistoryFromEducationalBackground < ActiveRecord::Migration[5.2]
  def up
    remove_column :educational_backgrounds, :educational_history
  end

  def down
    add_column :educational_backgrounds, :educational_histroy, :integer
  end
end
