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
  belongs_to :academic_year
  has_many :subject_class_materials
  has_many :subject_class_teachers
  has_many :subject_class_students
  has_many :users, through: :subject_class_teachers
  has_many :users, through: :subject_class_students
end
