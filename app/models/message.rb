class Message < ApplicationRecord
  # belongs_to :recipient, class_name: 'User'
  # belongs_to :sender, class_name: 'User'
  belongs_to :user
  belongs_to :conversation

  # belongs_to :post, optional: true
  has_many :comments, dependent: :destroy
end
