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
user_avatar =
  URI.open('https://ca.slack-edge.com/T02NE0241-U4APKLFLM-da0b004a3774-512')
user1.image.attach(
  io: user_avatar, filename: 'user_avatar.png', content_type: 'image/png'
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

post1 = Post.create(user: user1, description: 'my first post')
image1 =
  URI.open(
    'https://images.pexels.com/photos/9198/nature-sky-twilight-grass-9198.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
  )
image2 =
  URI.open(
    'https://images.pexels.com/photos/957024/forest-trees-perspective-bright-957024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
  )
post1.images.attach(
  io: image1, filename: 'post1image1', content_type: 'image/png'
)
post1.images.attach(
  io: image2, filename: 'post1image2', content_type: 'image/jpg'
)
post2 = Post.create(user: user1, description: 'my next post')
image1 =
  URI.open(
    'https://images.pexels.com/photos/1295138/pexels-photo-1295138.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
  )
image2 =
  URI.open(
    'https://images.pexels.com/photos/753619/pexels-photo-753619.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'
  )
post2.images.attach(
  io: image1, filename: 'post2image1', content_type: 'image/png'
)
post2.images.attach(
  io: image2, filename: 'post2image2', content_type: 'image/jpg'
)
message1 =
  Message.create(recipient: user1, sender: user2, content: 'hi', post: post1)
message2 = Message.create!(recipient: user2, sender: user1, content: 'u suck')

comment1 =
  Comment.create(user: user1, content: 'i am awesome', likes: 10, post: post1)
comment2 = Comment.create(user: user1, reaction: 1, message: message1)

comment3 = Comment.create(user: user2, reaction: 2)

comment4 = Comment.create(user: user2, content: 'ur reaction: 1 sux')

user_tag1 = UserTag.create(user: user3, post: post1)
user_tag2 = UserTag.create(user: user1, post: post2)
bookmark1 = Bookmark.create(user: user3, post: post2)

notification1 = Notification.create!(user: user1, comment: comment4)
notification2 = Notification.create!(user: user1, user_tag: user_tag2)

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
# comment.replies            => [] #replies + reactions
# comment.parent             => comment
# user.comments             => [] user's comments&reactions to posts&messages

# user.notifications        => []
# notification.comment
# notification.post
# notification.response
# notification.user_tag

# new post /
# message index
