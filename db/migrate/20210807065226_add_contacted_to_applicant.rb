class AddContactedToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :contacted, :boolean, default: false
  end
end
