class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :subject_class_student, null: false, foreign_key: true
      t.boolean :presence
      t.datetime :deleted_at 

      t.timestamps
    end
  end
end
