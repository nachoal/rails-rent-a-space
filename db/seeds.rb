require 'faker'

5.times do
  User.new(email: Faker::Internet.email, password: 'testtest')
end