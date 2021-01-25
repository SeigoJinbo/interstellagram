class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :message, optional: true
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :likes
  has_many :replies,
           class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_one :notification, dependent: :destroy

  validates :content, presence: true
  validates :user, presence: true
end
