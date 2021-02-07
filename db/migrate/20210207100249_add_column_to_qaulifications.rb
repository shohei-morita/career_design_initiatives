class AddColumnToQaulifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :qualifications, :student, foreign_key: true
  end
end
