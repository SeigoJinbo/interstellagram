class Post < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :comments
end
