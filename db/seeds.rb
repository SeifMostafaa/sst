# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  User.create(email: "user-#{i+101}@example.com", password: "password", password_confirmation: "password", first_name: "Magdy", second_name: "Mahmoud", third_name: "Mohamed", last_name: "Hamed", role: :admin, locale: :en, phone: "+201111111#{i + 101}", date_of_birth: Date.today, status: :active, gender: :male, username: "user#{i + 101}" )
end

20.times do |i|
  User.create(email: "user-#{i+202}@example.com", password: "password", password_confirmation: "password", first_name: "Magdy", second_name: "Mahmoud", third_name: "Mohamed", last_name: "Hamed", role: :staff, locale: :ar, phone: "+201111111#{i + 202}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 202}" )
end

20.times do |i|
  User.create(email: "user-#{i+303}@example.com", password: "password", password_confirmation: "password", first_name: "Magdy", second_name: "Mahmoud", third_name: "Mohamed", last_name: "Hamed", role: :teacher, locale: :en, phone: "+201111111#{i + 303}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 303}" )
end

20.times do |i|
  User.create(email: "user-#{i+404}@example.com", password: "password", password_confirmation: "password", first_name: "Magdy", second_name: "Mahmoud", third_name: "Mohamed", last_name: "Hamed", role: :parents, locale: :ar, phone: "+201111111#{i + 404}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 404}" )
end

20.times do |i|
  User.create(email: "user-#{i+505}@example.com", password: "password", password_confirmation: "password", first_name: "Magdy", second_name: "Mahmoud", third_name: "Mohamed", last_name: "Hamed", role: :student, locale: :ar, phone: "+201111111#{i + 505}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 505}" )
end