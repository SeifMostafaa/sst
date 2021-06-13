class AddStatusColumnToAcademicYear < ActiveRecord::Migration[6.1]
  def change
    add_column :academic_years, :status, :integer
  end
end
