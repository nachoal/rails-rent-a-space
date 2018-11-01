Rental.destroy_all
Space.destroy_all

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
