class Notification < ApplicationRecord
  belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'

  belongs_to :post, optional: true
  belongs_to :response, optional: true
  belongs_to :user_tag, optional: true
  belongs_to :comment, optional: true
end
