# == Schema Information
#
# Table name: academic_years
#
#  id         :bigint           not null, primary key
#  start_date :datetime
#  end_date   :datetime
#  semester   :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AcademicYear < ApplicationRecord
  acts_as_paranoid

  enum semester: %i[1 2]
end
