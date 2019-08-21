puts "Creating avatars"
i = Avatar.count + 1
while i <= 6
  Avatar.create!(image: "avatar-#{i}.png")
  i += 1
end
puts "Avatars created"

puts "Creating categories"
categories = ["Animal rights", "Charity", "Disabled people", "Elderly people", "Environment"]
xp = [20, 30, 40, 40, 60]
j = Category.count + 1
while j <= 5
  Category.create!(name: categories[j-1], picture: "category-#{j}.png", xp: xp[j-1])
  j += 1
end
puts "Categories created"
