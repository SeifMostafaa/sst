class CreateApplicantTest < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_tests do |t|
      t.references :applicant, null: false, foreign_key: true
      t.datetime :test_date
      t.integer :result
      t.text :notes
      t.integer :test_type
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
