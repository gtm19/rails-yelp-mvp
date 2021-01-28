# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Destroying all records..."
Restaurant.destroy_all
Review.destroy_all

p "Creating some restaurants"
5.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant.categories.sample
  )
end

p "Creating some Reviews"
20.times do
  Review.create(
    rating: (0..5).to_a.sample,
    content: Faker::Restaurant.review,
    restaurant: Restaurant.all.sample
  )
end