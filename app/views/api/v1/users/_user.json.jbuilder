json.extract! user, :id, :username, :first_name, :middle_name, :last_name, :role, :locale, :phone, :date_of_birth, :status, :gender, :email, :created_at, :updated_at
json.token user.generate_jwt