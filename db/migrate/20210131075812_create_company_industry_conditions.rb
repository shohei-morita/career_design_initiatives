class CreateCompanyIndustryConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :company_industry_conditions do |t|
      t.references :company, foreign_key: true
      t.references :condition, foreign_key: true
      t.timestamps
    end
  end
end
