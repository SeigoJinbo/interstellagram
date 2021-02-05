class AddColumnsToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :message, :text
    add_column :notifications, :sender_id, :integer
    add_column :notifications, :receiver_id, :integer
  end
end
