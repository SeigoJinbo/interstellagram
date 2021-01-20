class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :message, optional: true

  has_many :received_originals,
           foreign_key: :original_id,
           class_name: 'Response',
           dependent: :destroy
  has_many :replys,
           through: :received_originals, source: :reply, dependent: :destroy

  has_one :given_reply, foreign_key: :reply_id, class_name: 'Response'
  has_one :original, through: :given_reply, source: :original
end
