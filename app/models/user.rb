class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

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
  has_many :sent_messages,
           class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages,
           class_name: 'Message',
           foreign_key: 'recipient_id',
           dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :tagged_posts, through: :user_tags, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
