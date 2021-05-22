# == Schema Information
#
# Table name: majors
#
#  id             :bigint           not null, primary key
#  name_en        :string
#  name_ar        :string
#  description_en :string
#  description_ar :string
#  status         :integer
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Major < ApplicationRecord
  acts_as_paranoid

  enum status: %i[active suspended]
end
