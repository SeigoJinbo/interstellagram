class CreatePostHashTags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_hash_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :hash_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
