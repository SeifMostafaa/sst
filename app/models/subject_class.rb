# == Schema Information
#
# Table name: subject_classes
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  number           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  academic_year_id :bigint           not null
#  subject_id       :bigint           not null
#
# Indexes
#
#  index_subject_classes_on_academic_year_id  (academic_year_id)
#  index_subject_classes_on_deleted_at        (deleted_at)
#  index_subject_classes_on_subject_id        (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (academic_year_id => academic_years.id)
#  fk_rails_...  (subject_id => subjects.id)
#
class SubjectClass < ApplicationRecord
  acts_as_paranoid

  belongs_to :subject
end
