class RenamePreviousSchoolToPreparatorySchool < ActiveRecord::Migration[6.1]
  def change
    rename_column :applicants, :previous_school, :preparatory_school
  end
end
