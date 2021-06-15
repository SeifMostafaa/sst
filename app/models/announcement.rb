# == Schema Information
#
# Table name: announcements
#
#  id                :bigint           not null, primary key
#  announcement_type :integer
#  deleted_at        :datetime
#  description_ar    :string
#  description_en    :string
#  title_ar          :string
#  title_en          :string
#  user_type         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_announcements_on_deleted_at  (deleted_at)
#
class Announcement < ApplicationRecord
  acts_as_paranoid

  enum announcement_type: %i[event news notice]
  enum user_type: %i[generic parents specific staff student teacher]

  has_one_attached :attachment
end
