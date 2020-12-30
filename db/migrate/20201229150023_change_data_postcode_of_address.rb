class ChangeDataPostcodeOfAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postcode, :string
  end
end
