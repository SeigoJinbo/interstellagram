class Post < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :tagged_users, through: :user_tags, source: :user
  has_many :bookmarks, dependent: :destroy
  has_one :notification, dependent: :destroy
end
