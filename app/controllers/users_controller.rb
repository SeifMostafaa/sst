class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    user = CreateUserService.call(user_params, current_user.role)
    @response = if user.error.nil? && user.response.save
                  { successful: true, redirect_url: users_path }
                else
                  { successful: false, errors: user.error }
                end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:address_ar, :address_en, :date_of_birth, :email, :password, :password_confirmation,
                                 :full_name_en, :full_name_ar, :gender, :phone, :religion, :role, :username, :national_id)
  end
end
