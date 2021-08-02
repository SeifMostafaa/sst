class CreateStudentMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :student_majors do |t|
      t.reference :user
      t.reference :major

      t.timestamps
    end
  end
end
