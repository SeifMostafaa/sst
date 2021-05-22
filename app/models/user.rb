# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer
#  locale                 :integer
#  phone                  :string
#  date_of_birth          :date
#  status                 :integer
#  gender                 :integer
#  username               :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  deleted_at             :datetime
#  national_id            :string
#  religion               :integer
#  city                   :integer
#  full_name_en           :string
#  full_name_ar           :string
#  address_en             :string
#  address_ar             :string
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
  enum role: %i[admin engineer parents staff student teacher]
  enum status: %i[active graduated inactive suspended]

  def generate_jwt
    JWT.encode({ id: id,
                exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
