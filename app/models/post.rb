class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :tagged_users, through: :user_tags, source: :user
  has_many :bookmarks, dependent: :destroy
  has_one :notification, dependent: :destroy
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  has_many_attached :images
  validates :images, presence: true
  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_name_hash_tags.each { |name| hash_tags.create(name: name) }
  end

  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map { |name| name.gsub('#', '') }
  end
end
