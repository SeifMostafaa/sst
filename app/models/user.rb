class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  enum gender: %i[female male]
  enum locale: %i[ar en]
  enum role: %i[admin parents staff student teacher]
  enum status: %i[active graduated inactive suspended]
end
