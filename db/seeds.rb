Rental.destroy_all
Space.destroy_all

<<<<<<< HEAD
space = Space.new(
  name: Faker::Company.buzzword,
  description: Faker::Lorem.paragraph,
  address: Faker::Address.street_address,
  city: Faker::Address.city,
  country: Faker::Address.country,
  capacity: (25..1000).to_a.sample,
  price: (2000..400_000).to_a.sample,
  user: User.first,
  wifi: true,
  bathrooms: 2,
  cleaning: false,
  photo: Unsplash::Photo.search("party")
)
space.save!
=======
executions = 6
executions.times do
  space = Space.new(
    name: Faker::Company.buzzword,
    description: Faker::Lorem.paragraph,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    country: Faker::Address.country,
    capacity: (25..1000).to_a.sample,
    price: (2000..400_000).to_a.sample,
    user: User.first,
    wifi: true,
    bathrooms: 2,
    cleaning: false
  )
  space.save!
end

puts "#{executions} spaces created successfully!"
>>>>>>> baec7755f25ed257f40d2aeee9a9efb6591cc044
