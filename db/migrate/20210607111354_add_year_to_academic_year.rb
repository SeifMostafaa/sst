class AddYearToAcademicYear < ActiveRecord::Migration[6.1]
  def change
    add_column :academic_years, :year, :string
  end
end
