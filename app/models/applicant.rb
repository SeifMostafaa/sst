# == Schema Information
#
# Table name: applicants
#
#  id                     :bigint           not null, primary key
#  address                :string
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
#  previous_school        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  major_first_choice_id  :bigint           not null
#  major_second_choice_id :bigint           not null
#  national_id            :integer
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
  belongs_to :major_first_choice_id, class_name: 'Major'
  belongs_to :major_second_choice_id, class_name: 'Major'

  enum gender: %i[female male]
end
