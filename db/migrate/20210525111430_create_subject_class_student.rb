class CreateSubjectClassStudent < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_class_students do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject_class, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :subject_class_students, :deleted_at
  end
end
