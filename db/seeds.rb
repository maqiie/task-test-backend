# # db/seeds.rb
# # db/seeds.rb

# require 'faker'

# # Create 50 users with random email addresses and a dummy password
# 50.times do
#   User.find_or_create_by!(email: Faker::Internet.unique.email) do |user|
#     user.provider = "email"
#     user.uid = Faker::Internet.unique.email
#     user.password = "password123" # Dummy password
#     user.allow_password_change = false
#     user.role = "user"
#     user.created_at = Faker::Time.backward(days: 365)
#     user.updated_at = Faker::Time.backward(days: 30)
#   end
# end
