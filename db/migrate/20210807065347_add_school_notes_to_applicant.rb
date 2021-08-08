class AddSchoolNotesToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :school_notes, :text
  end
end
