# == Schema Information
#
# Table name: majors
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  description_ar :string
#  description_en :string
#  name_ar        :string
#  name_en        :string
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_majors_on_deleted_at  (deleted_at)
#
class Major < ApplicationRecord
  acts_as_paranoid

  enum status: %i[active suspended]

  has_many :subjects
  has_many :users, through: :subjects
end
