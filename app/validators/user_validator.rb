class UserValidator < ActiveModel::Validator
  VALID_PHONE_NUMBER_REGEX = /\(?\+[0-9]{1,3}\)?[0-9]{5,12}/.freeze

  def validate(user, current_user_role)
    @user = user
    @current_user_role = current_user_role
    validate_presence_of_address_ar
    validate_presence_of_date_of_birth
    validate_presence_of_email
    validate_presence_of_full_name_ar
    validate_presence_of_gender
    validate_presence_of_phone
    validate_presence_of_religion
    validate_presence_of_role
    validate_presence_of_username
    validate_presence_of_national_id
    validate_presence_of_password
    validate_presence_of_password_confirmation
    validate_similarity_of_password_and_password_confirmation
  end

  private

  def validate_presence_of_address_ar
    @user.errors.add(:address_ar, 'Arabic Address is missing.') if @user.address_ar.blank?
  end

  def validate_presence_of_date_of_birth
    @user.errors.add(:date_of_birth, 'Date Of Birth is missing.') if @user.date_of_birth.blank?
  end

  def validate_presence_of_email
    if @user.email.blank?
      @user.errors.add(:email, 'Email is missing.')
    else
      validate_uniqueness_of_email
    end
  end

  def validate_uniqueness_of_email
    users = User.where(email: @user.email)
    users_count = users.count
    if @user.new_record? && users_count >= 1
      @user.errors.add(:email, 'Email already exists.')
    elsif @user.persisted?
      if users_count > 1
        @user.errors.add(:email, 'Email already exists.')
      elsif users_count == 1 && @user.id != users.first.id
        @user.errors.add(:email, 'Email already exists.')
      end
    end
  end

  def validate_presence_of_full_name_ar
    @user.errors.add(:full_name_ar, 'Arabic Full Name is missing.') if @user.full_name_ar.blank?
  end

  def validate_presence_of_gender
    @user.errors.add(:gender, 'Gender is missing.') if @user.gender.blank?
  end

  def validate_presence_of_phone
    @user.errors.add(:phone, 'Phone Number is missing.') if @user.phone.blank?
  end

  def validate_phone_format
    @user.errors.add(:phone, 'Phone Number format is incorrect') unless @user.phone =~ VALID_PHONE_NUMBER_REGEX
  end

  def validate_presence_of_religion
    @user.errors.add(:religion, 'Religion is missing.') if @user.religion.blank?
  end

  def validate_presence_of_role
    if @user.role.blank?
      @user.errors.add(:role, 'Role is missing.')
    else
      validate_authority_of_role_creator
    end
  end

  def validate_authority_of_role_creator
    if @current_user_role != 'admin' && @user.admin?
      @user.errors.add(:role,
                       'You are not authorized to create an Admin.')
    end
  end

  def validate_presence_of_username
    if @user.username.blank?
      @user.errors.add(:username, 'Username is missing.')
    else
      validate_uniqueness_of_username
    end
  end

  def validate_uniqueness_of_username
    users = User.where(username: @user.username)
    users_count = users.count
    if @user.new_record? && users_count >= 1
      @user.errors.add(:username, 'Username already exists.')
    elsif @user.persisted?
      if users_count > 1
        @user.errors.add(:username, 'Username already exists.')
      elsif users_count == 1 && @user.id != users.first.id
        @user.errors.add(:username, 'Username already exists.')
      end
    end
  end

  def validate_presence_of_national_id
    if @user.national_id.blank?
      @user.errors.add(:national_id, 'National ID is missing.')
    else
      validate_uniqueness_of_national_id
    end
  end

  def validate_uniqueness_of_national_id
    users = User.where(national_id: @user.national_id)
    users_count = users.count
    if @user.new_record? && users_count >= 1
      @user.errors.add(:national_id, 'National ID already exists.')
    elsif @user.persisted?
      if users_count > 1
        @user.errors.add(:national_id, 'National ID already exists.')
      elsif users_count == 1 && @user.id != users.first.id
        @user.errors.add(:national_id, 'National ID already exists.')
      end
    end
  end

  def validate_presence_of_password
    @user.errors.add(:password, 'Password is missing.') if @user.password.blank?
  end

  def validate_presence_of_password_confirmation
    @user.errors.add(:password_confirmation, 'Password Confirmation is missing.') if @user.password_confirmation.blank?
  end

  def validate_similarity_of_password_and_password_confirmation
    if !(@user.password.blank? || @user.password_confirmation.blank?) && (@user.password != @user.password_confirmation)
      @user.errors.add(:password_confirmation, 'Password Confirmation does not match.')
    end
  end
end
