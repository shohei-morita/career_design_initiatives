class ChangEducationaBackgroundToEducationalBackground < ActiveRecord::Migration[5.2]
  def change
    rename_table :educationa_backgrounds, :educational_backgrounds
  end
end
