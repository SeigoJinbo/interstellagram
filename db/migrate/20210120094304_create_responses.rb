class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :original, null: false, foreign_key: { to_table: :comments }
      t.references :reply, null: false, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
