# == Schema Information
#
# Table name: subjects
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  description_ar :string
#  description_en :string
#  name_ar        :string
#  name_en        :string
#  semester       :integer
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  major_id       :bigint
#
# Indexes
#
#  index_subjects_on_deleted_at  (deleted_at)
#  index_subjects_on_major_id    (major_id)
#
class Subject < ApplicationRecord
  acts_as_paranoid

  enum status: %i[active suspended]
  enum semester: %i[1 2 3 4 5 6]

  belongs_to :major
  has_many :subject_classes
  has_many :users, through: :subject_classes
end
