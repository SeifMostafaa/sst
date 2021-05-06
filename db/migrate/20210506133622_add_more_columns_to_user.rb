class AddMoreColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :second_name, :string
    add_column :users, :third_name, :string
    add_column :users, :national_id, :string
    add_column :users, :religion, :integer
    add_column :users, :city, :integer
    add_column :users, :address, :string
  end
end
