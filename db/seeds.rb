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
posts = []
5.times do |i|
  post = Post.create!(
    user: users.sample,
    title: "Post #{i+1}",
    content: "This is a sample post #{i+1}",
    image: File.open(File.join(Rails.root, 'app/images/test.jpg'))
  )
  posts << post
  puts "Created post #{post.id}"
end

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
