class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :locale, :integer
    add_column :users, :phone, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :status, :integer
    add_column :users, :gender, :integer
    add_column :users, :username, :string
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_index :users, :username, unique: true
  end
end
