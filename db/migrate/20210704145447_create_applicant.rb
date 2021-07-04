class CreateApplicant < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :full_name
      t.decimal :grade
      t.date :date_of_birth
      t.integer :national_id
      t.string :address
      t.string :parent_full_name
      t.string :parent_occupation
      t.string :parent_phone
      t.string :emergency_phone
      t.text :notes
      t.references :major_first_choice, null: false, foreign_key: { to_table: 'majors' }
      t.references :major_second_choice, null: false, foreign_key: { to_table: 'majors' }
      t.datetime :deleted_at
      t.integer :gender
      t.string :previous_school

      t.timestamps
    end
    add_index :applicants, :deleted_at
  end
end
