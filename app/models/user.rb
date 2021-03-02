class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :connections_as_following,
           class_name: 'Connection', foreign_key: :following_id

  has_many :received_follows,
           foreign_key: :following_id,
           class_name: 'Connection',
           dependent: :destroy
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows,
           foreign_key: :follower_id,
           class_name: 'Connection',
           dependent: :destroy
  has_many :followings, through: :given_follows, source: :following

  has_many :posts, dependent: :destroy
  # has_many :sent_messages,
  #          class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  # has_many :received_messages,
  #          class_name: 'Message',
  #          foreign_key: 'recipient_id',
  #          dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :tagged_posts, through: :user_tags, source: :post
  has_many :bookmarks, dependent: :destroy
  # has_many :notifications, dependent: :destroy
  has_many :notifications_as_receiver,
           class_name: 'Notification',
           foreign_key: :receiver_id,
           dependent: :destroy
  has_many :notifications_as_sender,
           class_name: 'Notification',
           foreign_key: :sender_id,
           dependent: :destroy
  has_one_attached :image

  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :user_name, presence: :true, uniqueness: :true
  validates :user_name,
            format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'only allows letters' }
  validates :user_name, length: { maximum: 12, too_long: 'is too long' }
  validates :user_name, length: { minimum: 2, too_long: 'is too short' }
  validates :email, presence: :true, uniqueness: :true
  def has_joined?(conversation)
    conversations.where(id: conversation).exist?
  end
end
