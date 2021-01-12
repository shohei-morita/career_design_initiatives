class AddRevenueToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :revenue, :text
  end
end
