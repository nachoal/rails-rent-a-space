require 'faker'

6.times do
  space = Space.new(name: Faker::Company.buzzword,
            description: Faker::Lorem.paragraph,
            address: Faker::Address.street_address,
            city: Faker::Address.city,
            country: Faker::Address.country,
            capacity: [25..1000].sample,
            price: [2000..400.000].sample,
            user_id: 1)
  space.save!
end

puts "6 space created successfully!"
