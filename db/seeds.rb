# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Starting to seed data"

# Create Users
5.times do
  User.create!(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

users = User.all

# Create Posts
users.each do |user|
  3.times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      remote_image_url: Faker::Placeholdit.image(size: '300x300')
    )
    puts "Created post #{post.id}"
  end
end

posts = Post.all

# Create Comments
posts.each do |post|
  users.sample(3).each do |user|
    comment = post.comments.create!(
      user: user,
      content: Faker::Lorem.sentence
    )
    puts "Created comment #{comment.id}"
  end
end

# Create Likes
posts.each do |post|
  users.sample(3).each do |user|
    like = post.likes.create!(
      user: user
    )
    puts "Created like #{like.id}"
  end
end

puts "Seeding data completed!"
