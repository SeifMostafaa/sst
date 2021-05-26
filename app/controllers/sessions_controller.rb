class SessionsController < Devise::SessionsController
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :authenticate_user?

  api :POST, 'api/v1/users/login', 'User login'
  param :email, String, desc: 'User email'
  param :password, String, desc: 'User password'
  returns code: 422 do
    property :errors, Hash, desc: 'Email or password is invalid'
  end
  returns code: 200, desc: 'a successful response' do
    property :user, Hash, desc: 'User object' do
      property :id, Integer, desc: "User's ID"
      property :username, String, desc: "User's Username"
      property :full_name_ar, String, desc: "User's arabic full name"
      property :full_name_en, String, desc: "User's english full name"
      property :role, %w[admin engineer parents staff student teacher],
               desc: "User's role, one of 6 possible string values"
      property :locale, %w[ar en], desc: "User's locale language, one of 2 possible string values"
      property :phone, String, desc: "User's phone number"
      property :date_of_birth, String, desc: "User's date of birth"
      property :status, %w[active graduated inactive suspended],
               desc: "User's status, one of 4 possible string values"
      property :gender, %w[female male], desc: "User's gender, one of 2 possible string values"
      property :email, String, desc: "User's email address"
      property :national_id, String, desc: "User's national ID"
      property :religion, %w[christian muslim], desc: "User's religion, one of 2 possible string values"
      property :address_ar, String, desc: "User's arabic address"
      property :address_en, String, desc: "User's english address"
      property :city, ['alexandria'], desc: "User's city, one of 1 possible string values"
      property :token, String, desc: "User's token"
    end
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
