# == Schema Information
#
# Table name: academic_years
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  end_date   :datetime
#  semester   :integer
#  start_date :datetime
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_academic_years_on_deleted_at  (deleted_at)
#
class AcademicYear < ApplicationRecord
  acts_as_paranoid

  enum semester: %i[1 2]

  has_many :subject_classes
end
