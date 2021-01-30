class AddColumnsToScoutMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :scout_messages, :recruiter, foreign_key: true
    add_reference :scout_messages, :student, foreign_key: true
  end
end
