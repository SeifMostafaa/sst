class CreateMajor < ActiveRecord::Migration[6.1]
  def change
    create_table :majors do |t|
      t.string :name_en
      t.string :name_ar
      t.string :description_en
      t.string :description_ar
      t.integer :status
      t.datetime :deleted_at
      
      t.timestamps
    end
    add_index :majors, :deleted_at
  end
end
