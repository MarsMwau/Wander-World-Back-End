# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Started seeding data!"

# Create users
10.times do
  User.create(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: 'password',
    bio: Faker::Lorem.sentence(word_count: 10)
  )
end

users = User.all

# Create posts with comments and likes
users.each do |user|
  10.times do
    post = Post.create(
      title: Faker::Lorem.words(number: 5).join(' '),
      content: Faker::Lorem.sentences(number: 5).join(' '),
      image: 'https://i.pinimg.com/564x/ac/6e/38/ac6e38362967ac16d3e0a8280f06dcfa.jpg',
      user: user
    )
    puts "Created post #{post.id}"
    5.times do
      comment = Comment.create(
        content: Faker::Lorem.sentence(word_count: 8),
        user: users.sample,
        post: post
      )
      puts "Created comment #{comment.id}"
    end
    rand(8..25).times do
      like = Like.create(
        user: users.sample,
        post: post
      )
      puts "Created like #{like.id}"
    end
  end
end

puts "Seeding completed successfully!"
