class RemoveColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :second_name, :string
    remove_column :users, :third_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :address, :string
  end
end
