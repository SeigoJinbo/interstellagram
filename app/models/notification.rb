class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :response, optional: true
  belongs_to :user_tag, optional: true
  belongs_to :comment, optional: true
end
