class CreateTimeTable < ActiveRecord::Migration[6.1]
  def change
    create_table :time_tables do |t|
      t.integer :day
      t.integer :period
      t.references :subject_class, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :time_tables, :deleted_at
  end
end
