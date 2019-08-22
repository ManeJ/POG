# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting existing seed"
Quest.destroy_all
User.destroy_all

puts "Creating avatars"
i = Avatar.count + 1
while i <= 6
  Avatar.create!(image: "avatar-#{i}.png")
  i += 1
end
puts "Avatars created"

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

mode = ["Solo", "Group"]

puts "Creating categories"
categories = ["Animal rights", "Charity", "Disabled people", "Elderly people", "Environment"]
xp = [20, 30, 40, 40, 60]
j = Category.count + 1
while j <= 5
  Category.create!(name: categories[j-1], picture: "category-#{j}.png", xp: xp[j-1])
  j += 1
end
puts "Categories created"

city = ["Tokyo", "Delhi", "Shanghai", "São Paulo", "Mexico", "Dhaka", "Le Caire",
        "Pékin", "Bombay", "Osaka", "New York", "Karachi", "Chongqing", "Istanbul",
         "Buenos Aires", "Calcutta", "Lagos", "Kinshasa", "Manille", "Tianjin"]

puts "Generate quests..."
20.times do
  Quest.create!(
    title: Faker::DcComics.title,
    description: Faker::Books::Lovecraft.fhtagn(number: 2),
    mode: mode.sample,
    people_wanted: (1..25).to_a.sample,
    address: city.uniq.sample,
    category: (1..5).to_a.sample,
    begin_on: Faker::Date.forward(days: 30),
    duration: '3 hours',
    user: User.all.sample
  )
end
puts "Quests generate successfully"


