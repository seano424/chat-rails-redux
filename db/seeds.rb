# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database"
puts "Destroying messages"
Message.destroy_all 
puts "Destroying users"
User.destroy_all
puts "Destroying channels"
Channel.destroy_all

# Channels
puts "Creating Channels"
names = [{name: "general"}, {name: "Paris"}, {name: "react"}, {name: "USA"}, {name: "rails"}, {name: "jobs"}]
names.each do |name| 
  channel = Channel.create!(name)
  puts "Created fake channel #{channel.name}"
end
puts "Finished creating Channels"

# Users
puts "Creating Users"
users = [
  {
    email: 'soreilly424@gmail.com',
    password: '123456'
  },
  {
    email: 'seanpatrickstudios@gmail.com',
    password: '123456'
  }
]
users.each do |user| 
  newUser = User.create!(user)
  puts "Created #{newUser.email}"
end
puts "Finished creating Users"

# Messages 
puts "Creating Messages"
user_ids = []
channel_ids = []
User.all.each { |u| user_ids << u.id }
Channel.all.each { |c| channel_ids << c.id }

messages = [
  {
    content: "Wow such cool!",
  },
  {
    content: "Wowowowowo such cool!",
  },
  {
    content: "Oh coool such cool!",
  },
  {
    content: "Oh again coool such cool!",
  },
  {
    content: "Eee Oh coool such cool!",
  },
] 
# Message.create!({content: 'trial', user_id: 1, channel_id: 1})
# messages.each do |msg| 
#   newMessage = Message.create!(msg)
#   puts "Created message #{newMessage.content} with channel_id #{newMessage.channel_id}"
# end
# puts "Finished creating Messages"


channel_ids.each_with_index do |id, idx|
  msg = { content: messages.sample[:content], user_id: user_ids.sample, channel_id: channel_ids[idx]}
  newMessage = Message.create!(msg)
  puts "Created message #{newMessage.content} with channel_id #{newMessage.channel_id}"
end