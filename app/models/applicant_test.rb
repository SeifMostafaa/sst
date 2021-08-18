# == Schema Information
#
# Table name: applicant_tests
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  notes        :text
#  result       :integer
#  test_date    :datetime
#  test_type    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :bigint           not null
#
# Indexes
#
#  index_applicant_tests_on_applicant_id  (applicant_id)
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
class ApplicantTest < ApplicationRecord
  acts_as_paranoid

  enum result: %i[fail n/a pass]
  enum test_type: %i[ability ability_remake medical medical_remake psychological psychological_remake
                     qualifying_session]
end
