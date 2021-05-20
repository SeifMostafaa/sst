class AddNameAndAddressColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name_en, :string
    add_column :users, :full_name_ar, :string
    add_column :users, :address_en, :string
    add_column :users, :address_ar, :string
  end
end
