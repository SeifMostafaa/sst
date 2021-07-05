class ChangeIntegerLimitForNationalIdInApplicants < ActiveRecord::Migration[6.1]
  def change
    change_column :applicants, :national_id, :integer, limit: 8
  end
end
