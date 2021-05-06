class DropColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :middle_name
  end
end
