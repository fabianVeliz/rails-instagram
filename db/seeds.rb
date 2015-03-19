5.times do |i|
  User.create(email: "user#{i}@users.com", password: "asdasdasd", user_name: "user #{i}")
  puts "-> User user#{i}@users.com created"
end
