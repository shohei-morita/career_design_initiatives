class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.date :foundation_year, null: false
      t.string :capital, null: false
      t.string :president_name, null: false
      t.text :url, null: false
      t.integer :number_of_employees, null: false
      t.text :business_outline
      t.references :recruiter, foreign_key: true

      t.timestamps
    end
  end
end
