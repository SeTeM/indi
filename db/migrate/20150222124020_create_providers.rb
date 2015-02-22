class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :uid, null: false
      t.text :raw
    end
    add_index :providers, :uid, unique: true
  end
end
