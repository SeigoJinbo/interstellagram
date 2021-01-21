class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :bio, :text
    add_column :users, :website, :string
    add_column :users, :color, :string
    add_column :users, :user_name, :string
  end
end
