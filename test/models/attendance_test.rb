# == Schema Information
#
# Table name: attendances
#
#  id                       :bigint           not null, primary key
#  deleted_at               :datetime
#  presence                 :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  subject_class_student_id :bigint           not null
#
# Indexes
#
#  index_attendances_on_subject_class_student_id  (subject_class_student_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_class_student_id => subject_class_students.id)
#
require "test_helper"

class AttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
