# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Connection.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@gmail.com', password: '123456')
user2 = User.create(email: 'user2@gmail.com', password: '123456')
user3 = User.create(email: 'user3@gmail.com', password: '123456')
Connection.create(following: user1, follower: user2)
Connection.create(following: user1, follower: user3)
Connection.create(following: user2, follower: user3)

Post.create(user: user1, description: 'my first post', likes: 5)
Post.create(user: user1, description: 'my next post', likes: 6)

# user.followers
# user.following
# user.posts
