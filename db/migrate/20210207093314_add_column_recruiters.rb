class AddColumnRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :confirmation_token, :string
    add_column :recruiters, :confirmed_at, :datetime
    add_column :recruiters, :confirmation_sent_at, :datetime
    add_column :recruiters, :unconfirmed_email, :string
    add_index :recruiters, :confirmation_token, unique: true
  end
end
