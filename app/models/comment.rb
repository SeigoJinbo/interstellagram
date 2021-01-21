class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :message, optional: true

  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies,
           class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  has_many :received_originals,
           foreign_key: :original_id,
           class_name: 'Response',
           dependent: :destroy
  has_many :replys,
           through: :received_originals, source: :reply, dependent: :destroy

  has_one :given_reply, foreign_key: :reply_id, class_name: 'Response'
  has_one :original, through: :given_reply, source: :original
  has_one :notification, dependent: :destroy
end
