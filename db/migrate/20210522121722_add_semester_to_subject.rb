class AddSemesterToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :semester, :integer
  end
end
