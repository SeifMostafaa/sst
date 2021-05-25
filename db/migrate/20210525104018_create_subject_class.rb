class CreateSubjectClass < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_classes do |t|
      t.references :academic_year, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :number
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :subject_classes, :deleted_at
  end
end
