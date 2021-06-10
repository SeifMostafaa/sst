class CreateSubjectClassMaterial < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_class_materials do |t|
      t.references :subject_class, null: false, foreign_key: true
      t.string :name_en
      t.string :name_ar
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :subject_class_materials, :deleted_at
  end
end
