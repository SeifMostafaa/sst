class CreateAcademicYear < ActiveRecord::Migration[6.1]
  def change
    create_table :academic_years do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :semester
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :academic_years, :deleted_at
  end
end
