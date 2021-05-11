class SessionsController < Devise::SessionsController
  protect_from_forgery unless: -> { request.format.json? }
  api :POST, "api/v1/users/login", "User login"
  param :email, String, desc: "User email"
  param :password, String, desc: "User password"
  returns :code => 422 do
    property :errors, Hash, :desc => "Email or password is invalid"
  end
  returns :code => 200, :desc => "a successful response" do
    property :user, Hash, :desc => "User object" do
      property :id, Integer, :desc => "User's ID"
      property :username, String, :desc => "User's Username"
      property :first_name, String, :desc => "User's first name"
      property :second_name, String, :desc => "User's second name"
      property :third_name, String, :desc => "User's third name"
      property :last_name, String, :desc => "User's last name"
      property :role, ['admin', 'engineer', 'parents', 'staff', 'student', 'teacher'], :desc => "User's role, one of 6 possible string values"
      property :locale, ['ar', 'en'], :desc => "User's locale language, one of 2 possible string values"
      property :phone, String, :desc => "User's phone number"
      property :date_of_birth, String, :desc => "User's date of birth"
      property :status, ['active', 'graduated', 'inactive', 'suspended'], :desc => "User's status, one of 4 possible string values"
      property :gender, ['female', 'male'], :desc => "User's gender, one of 2 possible string values"
      property :email, String, :desc => "User's email address"
      property :national_id, String, :desc => "User's national ID"
      property :religion, ['christian', 'muslim'], :desc => "User's religion, one of 2 possible string values"
      property :address, String, :desc => "User's address"
      property :city, ['alexandria'], :desc => "User's city, one of 1 possible string values"
      property :token, String, :desc => "User's token"
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