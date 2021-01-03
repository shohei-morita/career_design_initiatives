class RenameGuraduationOfEducationalBackground < ActiveRecord::Migration[5.2]
  def change
    rename_column :educational_backgrounds, :guraduation_date, :graduation_date
  end
end
