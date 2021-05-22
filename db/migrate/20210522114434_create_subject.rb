class CreateSubject < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name_en
      t.string :name_ar
      t.references :major
      t.string :description_ar
      t.string :description_en
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :subjects, :deleted_at
  end
end
