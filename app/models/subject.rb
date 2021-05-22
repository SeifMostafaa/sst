# == Schema Information
#
# Table name: subjects
#
#  id             :bigint           not null, primary key
#  name_en        :string
#  name_ar        :string
#  major_id       :bigint
#  description_ar :string
#  description_en :string
#  status         :integer
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  semester       :integer
#
class Subject < ApplicationRecord
  acts_as_paranoid

  enum status: %i[active suspended]
  enum semester: %i[1 2 3 4 5 6]

  belongs_to :major
end
