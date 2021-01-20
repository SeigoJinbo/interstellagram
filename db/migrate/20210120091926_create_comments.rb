class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: true, foreign_key: true
      t.references :message, null: true, foreign_key: true
      t.text :content
      t.integer :likes
      t.integer :reaction

      t.timestamps
    end
  end
end
