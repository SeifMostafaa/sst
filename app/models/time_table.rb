# == Schema Information
#
# Table name: time_tables
#
#  id               :bigint           not null, primary key
#  day              :integer
#  deleted_at       :datetime
#  end_time         :time
#  period           :integer
#  start_time       :time
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  subject_class_id :bigint           not null
#
# Indexes
#
#  index_time_tables_on_deleted_at        (deleted_at)
#  index_time_tables_on_subject_class_id  (subject_class_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_class_id => subject_classes.id)
#
class TimeTable < ApplicationRecord
  acts_as_paranoid

  enum day: %i[monday tuesday wednesday thursday friday saturday sunday]

  belongs_to :subject_class
  has_many :users, through: :subject_class
end
