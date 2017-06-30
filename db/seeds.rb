# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Product.destroy_all

50.times do |i|
  Product.create(
    name: Faker::Food.ingredient,
    cost: '%.2f' % (rand * (20-1) + 1),
    country: Faker::Address.country
  )
end

Product.all.each do |product|
  50.times do
    product.reviews.create(
      author: Faker::Name.name,
      body: Faker::Lorem.characters(250),
      rating: 1 + rand(5)
    )
  end
end
