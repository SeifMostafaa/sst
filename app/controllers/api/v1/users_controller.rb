class Api::V1::UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?, except: [:forgot_password]
  before_action :set_user, only: %i[show edit update destroy update_locale]
  def index
    if authorized?
      @users = User.all
    else
      handle_unauthorized
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
