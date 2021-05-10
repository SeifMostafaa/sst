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
