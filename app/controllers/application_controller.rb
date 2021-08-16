class ApplicationController < ActionController::Base
  around_action :switch_locale

  include ActiveStorage::SetCurrent
  protect_from_forgery unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user?, if: -> { request.format.json? }

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_user?
    authenticate_or_request_with_http_token do |token|
      jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

      @current_user_id = jwt_payload['id']
      @current_user = User.find(@current_user_id)
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      render(
        json: { "error": 'Invalid Access Token!' },
        status: :unauthorized
      )
    end
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
