class ChangeColumnsAddNotnullOnAwards < ActiveRecord::Migration[5.2]
  def change
    change_column_null :awards, :title, false
    change_column_null :awards, :year, false
  end
end
