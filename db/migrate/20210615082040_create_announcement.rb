class CreateAnnouncement < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.integer :announcement_type
      t.integer :user_type
      t.string :title_en
      t.string :title_ar
      t.string :description_en
      t.string :description_ar
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :announcements, :deleted_at
  end
end
