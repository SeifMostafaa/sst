class CreateUserService < ApplicationService
  include ActiveModel::Model

  attr_reader(
    :address_ar,
    :address_en,
    :date_of_birth,
    :email,
    :password,
    :password_confirmation,
    :full_name_en,
    :full_name_ar,
    :gender,
    :phone,
    :religion,
    :role,
    :username,
    :national_id
  )

  validate :validate_user

  def initialize(params = {}, current_user_role)
    @params = params
    @current_user_role = current_user_role
  end

  def call
    return fail(errors) if invalid?

    ActiveRecord::Base.transaction do
      success(@user)
    end
  end

  private

  def user_params
    @params.permit(
      :address_ar,
      :address_en,
      :date_of_birth,
      :email,
      :password,
      :password_confirmation,
      :full_name_en,
      :full_name_ar,
      :gender,
      :phone,
      :religion,
      :role,
      :username,
      :national_id
    )
  end

  def user
    @user ||= User.new(user_params)
  end

  def validate_user
    promote_errors(user.errors) unless user_valid?
  end

  def user_valid?
    UserValidator.new.validate(user, @current_user_role)
    user.errors.blank?
  end

  def promote_errors(object_errors)
    object_errors.each do |attribute, message|
      errors.add(attribute, message)
    end
  end
end
