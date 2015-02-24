class CreateTagsUsers < ActiveRecord::Migration
  def change
    create_table :tags_users, id: false do |t|
      t.integer :user_id, null: false
      t.integer :tag_id, null: false
    end

    add_index :tags_users, :tag_id
    add_index :tags_users, [:user_id, :tag_id], unique: true
  end
end
