# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting existing seed"
Quest.destroy_all
Category.destroy_all
User.destroy_all

puts "Creation of User..."

10.times do
  User.create!(
    username: Faker::Artist.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    role: 'individual'
  )
end

puts "User creation >> Sucess"

mode = ["solo", "duo", "multi"]

puts "Generate quests..."

category = Category.create!(
  name: "Health",
  description: "blablbalbalbalblabalab",
  picture: "photo"
  )

20.times do
  Quest.create!(
    title: Faker::DcComics.title,
    description: Faker::Books::Lovecraft.fhtagn(number: 2),
    mode: mode.sample,
    people_wanted: (1..25).to_a.sample,
    category: category,
    location: Faker::Address.full_address,
    begin_on: Faker::Date.forward(days: 30),
    duration: '3 hours',
    user: User.all.sample
  )
end

puts "Quests generate successfully"
