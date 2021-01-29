class UserConversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :user_id, scope: :conversation_id
end
