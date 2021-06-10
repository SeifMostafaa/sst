# == Schema Information
#
# Table name: subject_class_materials
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  name_ar          :string
#  name_en          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  subject_class_id :bigint           not null
#
# Indexes
#
#  index_subject_class_materials_on_deleted_at        (deleted_at)
#  index_subject_class_materials_on_subject_class_id  (subject_class_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_class_id => subject_classes.id)
#
class SubjectClassMaterial < ApplicationRecord
  acts_as_paranoid

  belongs_to :subject_class

  has_one_attached :file
end
