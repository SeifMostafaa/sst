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

  after_initialize :set_status

  enum status: %i[active suspended]

  has_many :subjects
  has_many :users, through: :subjects
  has_many :applicants_first_choices, class_name: 'Applicant', foreign_key: 'major_first_choice_id'
  has_many :applicants_second_choices, class_name: 'Applicant', foreign_key: 'major_second_choice_id'

  def set_status
    self.status ||= :active
  end
end
