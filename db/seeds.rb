User.destroy_all

user1 =
  User.create(
    email: 'user1@gmail.com',
    password: '123456',
    name: 'John Smith',
    user_name: 'AwesomeGuy69',
    birthday: Date.today,
    gender: 'male',
    bio: "i'm da best",
    color: 'blue'
  )
user2 =
  User.create(
    email: 'user2@gmail.com',
    password: '123456',
    name: 'Karen',
    user_name: 'Karen',
    birthday: Date.today,
    gender: 'female',
    bio: 'let me speak to your manager!',
    color: 'blue'
  )
user3 =
  User.create(
    email: 'user3@gmail.com',
    password: '123456',
    name: 'Tom',
    user_name: 'Tom from myspace',
    birthday: Date.today,
    gender: 'male',
    bio: '...',
    color: 'blue'
  )
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

user_tag1 = UserTag.create(user: user3, post: post1)
user_tag2 = UserTag.create(user: user1, post: post2)
bookmark1 = Bookmark.create(user: user3, post: post2)

notification1 = Notification.create!(user: user1, comment: comment4)
notification2 = Notification.create!(user: user1, user_tag: user_tag2)
notification3 = Notification.create!(user: user1, response: response2)

# user.followers           => []
# user.followings          => []
# user.posts               => []
# user.sent_messages       => []
# user.received_messages   => []
# user.tagged_posts        => [] posts that the user is tagged in
# user.bookmarks           => []

# post.tagged_users        => [] users tagged in the post

# message.sender           => user
# message.recipient        => user
# message.post             => post #optional

# comment.user              => user #commenter
# comment.replys            => [] #replies + reactions
# comment.original          => comment
# user.comments             => [] user's comments&reactions to posts&messages

# user.notifications        => []
# notification.comment
# notification.post
# notification.response
# notification.user_tag

# new post /
# message index
