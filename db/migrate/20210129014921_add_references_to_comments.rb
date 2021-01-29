class AddReferencesToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :message, null: true, foreign_key: true
  end
end
