class Conversation < ApplicationRecord
  has_many :user_conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_conversations

  def includes_user?(user)
    users.where(id: user).exist?
  end
end
