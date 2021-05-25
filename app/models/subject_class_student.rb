# == Schema Information
#
# Table name: subject_class_students
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  subject_class_id :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_subject_class_students_on_deleted_at        (deleted_at)
#  index_subject_class_students_on_subject_class_id  (subject_class_id)
#  index_subject_class_students_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_class_id => subject_classes.id)
#  fk_rails_...  (user_id => users.id)
#
class SubjectClassStudent < ApplicationRecord
  acts_as_paranoid

  belongs_to :subject_class
  belongs_to :user
end
