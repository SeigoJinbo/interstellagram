class Post < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
end
