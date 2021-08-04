# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address_ar             :string
#  address_en             :string
#  city                   :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  date_of_birth          :date
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  fcm_token              :text
#  full_name_ar           :string
#  full_name_en           :string
#  gender                 :integer
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locale                 :integer
#  phone                  :string
#  religion               :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  status                 :integer
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  national_id            :string
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  enum city: %i[alexandria]
  enum gender: %i[female male]
  enum locale: %i[ar en]
  enum religion: %i[christian muslim]
  enum role: %i[admin engineer parents staff student teacher applicant]
  enum status: %i[active graduated inactive suspended]

  has_many :subject_class_teachers
  has_many :subject_class_students
  has_many :subject_classes, through: :subject_class_teachers
  has_many :subject_classes, through: :subject_class_students
  has_many :time_tables, through: :subject_classes
  has_one :student_majors

  validates :locale, presence: true

  after_initialize :set_city, :set_locale, :set_status

  def set_city
    self.city ||= :alexandria
  end

  def set_locale
    self.locale ||= :ar
  end

  def set_status
    self.status ||= :active
  end

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
