# == Schema Information
#
# Table name: applicants
#
#  id                     :bigint           not null, primary key
#  address                :string
#  contacted              :boolean          default(FALSE)
#  date_of_birth          :date
#  deleted_at             :datetime
#  emergency_phone        :string
#  full_name              :string
#  gender                 :integer
#  grade                  :decimal(, )
#  notes                  :text
#  parent_full_name       :string
#  parent_occupation      :string
#  parent_phone           :string
#  preparatory_school     :string
#  registered             :boolean
#  school_notes           :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  major_first_choice_id  :bigint           not null
#  major_second_choice_id :bigint           not null
#  national_id            :bigint
#
# Indexes
#
#  index_applicants_on_deleted_at              (deleted_at)
#  index_applicants_on_major_first_choice_id   (major_first_choice_id)
#  index_applicants_on_major_second_choice_id  (major_second_choice_id)
#
# Foreign Keys
#
#  fk_rails_...  (major_first_choice_id => majors.id)
#  fk_rails_...  (major_second_choice_id => majors.id)
#
class Applicant < ApplicationRecord
  acts_as_paranoid

  belongs_to :major_first_choice, class_name: 'Major', foreign_key: 'major_first_choice_id'
  belongs_to :major_second_choice, class_name: 'Major', foreign_key: 'major_second_choice_id'

  enum gender: %i[female male]
end
