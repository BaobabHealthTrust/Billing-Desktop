# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Loading defaults"

puts "Creating User roles"
roles =[["Administrator", "This is the system administrator who handles all system functions"],
  ["Other", "Other system user"] ]

(roles || []).each do |role|
  new_role = Role.where({:role => role[0], :description => role[1]}).first_or_create
end

puts "Creating default user"
if User.find_by_username("admin").blank?
  user = User.create(username: "admin", password: "321Admin!")
  UserRole.create(user_id: user.id, role_id: 1)
end

puts "Login: username: admin password: 321Admin!"
