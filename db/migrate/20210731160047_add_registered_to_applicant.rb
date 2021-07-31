class AddRegisteredToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :registered, :boolean
  end
end
