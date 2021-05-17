class Api::V1::UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user, except: [:forgot_password]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
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

    def forgot_password
      @user = User.find_by_email(params[:email])
      if @user.present?
        @user.send_reset_password_instructions
        render(
          json: { "message": "You will receive an email with instructions on how to reset your password in a few minutes." }
        )
      else
        render(
          json: { "error": "Email not found" },
          status: 404
        )        
      end
    end
    private
        def set_user
          @user = User.find(params[:id])
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
            :first_name,
            :second_name,
            :third_name,
            :last_name,
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
            :address,
            :city
          )
        end
end
