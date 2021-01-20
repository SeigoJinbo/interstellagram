class Response < ApplicationRecord
  belongs_to :original, foreign_key: :original_id, class_name: 'Comment'
  belongs_to :reply, foreign_key: :reply_id, class_name: 'Comment'
  has_one :notification, dependent: :destroy
end
