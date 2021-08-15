class Api::V1::UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?, except: [:forgot_password]
  before_action :set_user, only: %i[show edit update destroy update_locale]

  api :GET, 'api/v1/users', 'Users'
  param :role, %w[parents staff student teacher],
        desc: "User's role, one of 4 possible string values"
  returns code: 401, desc: 'Unauthorized'
  returns code: 404, desc: 'Not Found'
  returns code: 200, desc: 'a successful response' do
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
  end
  def index
    case params[:role]
    when 'student'
      @users = User.student.all
    when 'parents'
      @users = User.parents.all
    when 'teacher'
      @users = User.teacher.all
    when 'staff'
      @users = User.staff.all
    else
      render(
        json: { "error": 'User Role is not found' },
        status: 404
      )
    end
  end

  def show
    if authorized?
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  def create
    @user = User.new(user_params)
    if authorized?
      respond_to do |format|
        if @user.save
          format.json { render :show, status: :created, location: api_v1_user_path(@user) }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def update
    if authorized?
      respond_to do |format|
        if @user.update(user_params)
          format.json { render :show, status: :ok, location: api_v1_user_path(@user) }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def destroy
    if authorized?
      @user.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  api :POST, 'api/v1/users/forgot_password', 'User Forgot Password'
  param :email, String, desc: 'User email'
  returns code: 404, desc: 'An unsuccessful response' do
    property :error, String, desc: 'Email not found'
  end
  returns code: 200, desc: 'A successful response' do
    property :message, String,
             desc: 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end
  def forgot_password
    @user = User.find_by_email(params[:email])
    if @user.present?
      @user.send_reset_password_instructions
      render(
        json: { "message": 'You will receive an email with instructions on how to reset your password in a few minutes.' }
      )
    else
      render(
        json: { "error": 'Email not found' },
        status: 404
      )
    end
  end

  api :PUT, 'api/v1/users/update_locale', 'User Language Update'
  param :locale, %w[ar en], desc: "User's locale language, one of 2 possible string values"
  returns code: 422, desc: 'Unprocessable Entity' do
    property :locale, Array, desc: 'can\'t be blank'
  end
  returns code: 200, desc: 'A successful response' do
    property :message, String,
             desc: 'Language has been updated.'
  end
  def update_locale
    respond_to do |format|
      if @user.update(locale: params[:locale])
        format.json do
          render json: { "message": 'Language has been updated.' }
        end
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def authorized?
    return false unless current_user

    admin? || staff?
  end

  def admin?
    current_user.admin?
  end

  def staff?
    current_user.staff?
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  def user_params
    params.require(:user).permit(
      :full_name_ar,
      :full_name_en,
      :role,
      :locale,
      :phone,
      :date_of_birth,
      :status,
      :gender,
      :username,
      :email,
      :password,
      :password_confirmation,
      :religion,
      :national_id,
      :address_ar,
      :address_en,
      :city
    )
  end
end
