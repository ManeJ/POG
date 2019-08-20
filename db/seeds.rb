puts "Creating avatars"
i = 1
while i <= 6
  Avatar.create!(image: "avatar-#{i}.png")
  i += 1
end
puts "Avatars created"
