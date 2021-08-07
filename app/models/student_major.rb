# == Schema Information
#
# Table name: student_majors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  major_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_student_majors_on_major_id  (major_id)
#  index_student_majors_on_user_id   (user_id)
#
class StudentMajor < ApplicationRecord
    belongs_to :majors
    belongs_to :users
end
