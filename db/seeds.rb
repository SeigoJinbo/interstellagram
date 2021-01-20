# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Response.destroy_all
# Comment.destroy_all
# Message.destroy_all
# Connection.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@gmail.com', password: '123456')
user2 = User.create(email: 'user2@gmail.com', password: '123456')
user3 = User.create(email: 'user3@gmail.com', password: '123456')
Connection.create(following: user1, follower: user2)
Connection.create(following: user1, follower: user3)
Connection.create(following: user2, follower: user3)

post1 = Post.create(user: user1, description: 'my first post', likes: 5)
post2 = Post.create(user: user1, description: 'my next post', likes: 6)
message1 =
  Message.create(recipient: user1, sender: user2, content: 'hi', post: post1)
message2 = Message.create!(recipient: user2, sender: user1, content: 'u suck')

comment1 =
  Comment.create(user: user1, content: 'i am awesome', likes: 10, post: post1)
comment2 = Comment.create(user: user1, reaction: 1, message: message1)

comment3 = Comment.create(user: user2, reaction: 2)
response1 = Response.create(original: comment2, reply: comment3)
comment4 = Comment.create(user: user2, content: 'ur reaction: 1 sux')
response2 = Response.create(original: comment2, reply: comment4)

# user.followers           => []
# user.following           => []
# user.posts               => []
# user.sent_messages       => []
# user.received_messages   => []

#message.sender            => user
#message.recipient         => user
#message.post              => post #optional

#comment.user              => user #commenter
#user.comments             => [] user's comments&reactions to posts&messages
