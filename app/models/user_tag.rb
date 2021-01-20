class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :notification, dependent: :destroy
end
